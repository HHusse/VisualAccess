using System;
using log4net;
using VisualAccess.Domain.Entities;
using VisualAccess.Domain.Interfaces.Repositories;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Reflection.Metadata;
using Newtonsoft.Json.Linq;
using VisualAccess.Domain.Interfaces.ServicesClient;
using VisualAccess.Domain.Exceptions;

namespace VisualAccess.FaceRecognition.Services
{
    public class RegisterFaceService
    {
        private readonly ILog log = LogManager.GetLogger(typeof(RegisterFaceService).Name);
        private readonly IAccountRepository repository;
        private readonly IFaceRecognitionServiceClient client;

        public RegisterFaceService(IAccountRepository repository, IFaceRecognitionServiceClient client)
        {
            this.repository = repository;
            this.client = client;
        }

        /// <returns>
        /// The task result contains a Result object with the following status codes:
        /// 0 - Success: The face was registered successfully.
        /// 1 - Failure: The account with the specified username was not found in the database.
        /// 2 - Failure: Something went wrong when trying to associate the face ID with the username in the database.
        /// 3 - Failure: The face recognition service client returned an error.
        /// 4 - Failure: Unknown
        /// </returns>
        public async Task<Result> Execute(string username, Stream faceStream, string contentType, string fileExtension)
        {
            DTOBase? dto = await repository.GetAccountByUsername(username);
            if (dto is null)
            {
                return new Result(false, $"There is no account with username {username}");
            }

            try
            {
                var response = await client.RegisterFaceAsync(faceStream, contentType, fileExtension);
                string responseContent = await response.Content.ReadAsStringAsync();

                if (responseContent.Length != 0)
                {
                    log.Info($"Raw body response from FaceRecognitionServiceClient \n{responseContent.Trim()}");
                }
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = JObject.Parse(responseContent);
                    var registeredId = jsonResponse["id"]!.Value<int>();

                    if (!await repository.AssociateFaceID(username, registeredId))
                    {
                        return new Result(false, 2, $"Somthing went wrong when trying to associte the face ID: {registeredId} with username: {username}");
                    }

                    log.Info($"Face registered successfully for username: {username} - ID: {registeredId}");
                    return new Result(true);
                }
                else
                {
                    var jsonResponse = JObject.Parse(responseContent);
                    var errorMessage = jsonResponse["message"]!.Value<string>();

                    log.Error($"Failed to register face for {username}. Response status: {response.StatusCode} Error: {errorMessage}");
                    return new Result(false, 3, errorMessage!);
                }
            }
            catch (Exception e)
            {
                LogException.Log(log, e);
                return new Result(false, 4, e.Message);
            }
        }
    }
}

