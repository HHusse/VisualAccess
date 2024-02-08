using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using VisualAccess.Domain.Interfaces.ServicesClient;
using Grpc.Core;
using VisualAccess.Domain.Enumerations;
using VisualAccess.DataAccess.Models;
using VisualAccess.DataAccess.Repositories;
using VisualAccess.Domain.Mappers;

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

        public async Task<ServiceResult> Execute(string username, MemoryStream faceStream)
        {
            AccountDTO? accountDTO = (AccountDTO?)await repository.GetAccount(username);
            if (accountDTO is null)
            {
                log.Warn($"Account with username {username.ToLower()} dosen't exist");
                return ServiceResult.ACCOUNT_NOT_FOUND;
            }

            Account account = Mapper<AccountDTO, Account>.Map(accountDTO);
            var faceRecognitionResult = await client.RegisterFaceAsync(faceStream);
            if (faceRecognitionResult.Item1 == FaceRecognitionResult.OK)
            {
                account.FaceID = faceRecognitionResult.Item2!;
                if (await repository.UpdateAccount(account) != DatabaseResult.OK)
                {
                    log.Error($"Somthing went wrong when trying to associte the face ID: {faceRecognitionResult.Item1} with username: {username}");
                    return ServiceResult.FACE_ASSOCIATION_FAIL;
                }

                log.Info($"Face registered successfully for username: {username} - ID: {faceRecognitionResult.Item1}");
                return ServiceResult.OK;

            }

            if (faceRecognitionResult.Item1 == FaceRecognitionResult.NOT_FOUND)
            {
                return ServiceResult.FACE_NOT_FOUND;
            }

            if (faceRecognitionResult.Item1 == FaceRecognitionResult.ALREADY_EXIST)
            {
                return ServiceResult.FACE_ALREADY_EXIST;
            }

            return ServiceResult.UNKNOWN_ERROR;
        }
    }
}
