using System;
using System.Net.Http;
using System.Net.Http.Headers;
using VisualAccess.Domain.Interfaces.ServicesClient;

namespace VisualAccess.FaceRecognition.ServicesClient
{
    public class FaceRecognitionServiceClient : IFaceRecognitionServiceClient
    {
        private readonly HttpClient httpClient;

        public FaceRecognitionServiceClient(HttpClient httpClient)
        {
            this.httpClient = httpClient;
        }

        public async Task<HttpResponseMessage> RegisterFaceAsync(Stream faceStream, string contentType, string fileExtension)
        {
            string serviceUrl = Environment.GetEnvironmentVariable("FACERECOGNITIONURL")!;
            using (var content = new MultipartFormDataContent())
            {
                var streamContent = new StreamContent(faceStream);
                if (!string.IsNullOrEmpty(contentType))
                {
                    streamContent.Headers.ContentType = new MediaTypeHeaderValue(contentType);
                }

                content.Add(streamContent, "file", $"FaceImage.{fileExtension}");
                string endpoint = serviceUrl + "/register";
                return await httpClient.PostAsync(endpoint, content);
            }
        }

        public async Task<HttpResponseMessage> VerifyFaceAsync(Stream faceStream, string contentType, string fileExtension)
        {
            string serviceUrl = Environment.GetEnvironmentVariable("FACERECOGNITIONURL")!;
            using (var content = new MultipartFormDataContent())
            {
                var streamContent = new StreamContent(faceStream);
                if (!string.IsNullOrEmpty(contentType))
                {
                    streamContent.Headers.ContentType = new MediaTypeHeaderValue(contentType);
                }

                content.Add(streamContent, "file", $"FaceImage.{fileExtension}");
                string endpoint = serviceUrl + "/verify";
                return await httpClient.PostAsync(endpoint, content);
            }
        }
    }
}

