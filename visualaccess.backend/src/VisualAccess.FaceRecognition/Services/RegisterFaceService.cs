using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using Grpc.Core;


namespace VisualAccess.FaceRecognition.Services
{
    public class RegisterFaceService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterFaceService));
        private readonly IAccountRepository repository;
        private readonly IFaceRecognitionServiceClient client;

        public RegisterFaceService(IAccountRepository repository, IFaceRecognitionServiceClient client)
        {
            this.repository = repository;
            this.client = client;
        }

        /// <returns>
        /// The task result contains a Result object with the following status codes:
        /// 1 - Failure: The account with the specified username was not found in the database.
        /// 2 - Failure: Something went wrong when trying to associate the face ID with the username in the database.
        /// 3 - Failure: The face recognition service could not detect any face.
        /// 4 - Failure: The face recognition service has detected that this face already exists.
        /// 5 - Failure: Unknown
        /// </returns>
        public async Task<Result> Execute(string username, MemoryStream faceStream)
        {
            bool exist = await repository.UsernameExist(username);
            if (!exist)
            {
                log.Error($"There is no account with username {username}");
                return new(false, 1, $"There is no account with provided username");
            }

            FaceRecognitionResult faceRecognitionResult = await client.RegisterFaceAsync(faceStream);
            if (faceRecognitionResult.StatusCode == 0)
            {
                if (!await repository.AssociateFaceID(username, (int)faceRecognitionResult.Id))
                {
                    log.Error($"Somthing went wrong when trying to associte the face ID: {faceRecognitionResult.Id} with username: {username}");
                    return new(false, 2, $"Something went wrong when trying to associated face with this account");
                }

                log.Info($"Face registered successfully for username: {username} - ID: {faceRecognitionResult.Id}");
                return new(true, faceRecognitionResult.Message);

            }

            if (faceRecognitionResult.StatusCode == (uint)StatusCode.NotFound)
            {
                return new(false, 3, faceRecognitionResult.Message);
            }

            if (faceRecognitionResult.StatusCode == (uint)StatusCode.AlreadyExists)
            {
                return new(false, 4, faceRecognitionResult.Message);
            }

            return new(false, 5, faceRecognitionResult.Message);
        }
    }
}
