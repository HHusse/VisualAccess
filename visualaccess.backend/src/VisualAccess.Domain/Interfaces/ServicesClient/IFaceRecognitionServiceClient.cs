using System;
namespace VisualAccess.Domain.Interfaces.ServicesClient
{
    public interface IFaceRecognitionServiceClient
    {
        public Task<HttpResponseMessage> RegisterFaceAsync(Stream faceStream, string contentType, string fileExtension);
        public Task<HttpResponseMessage> VerifyFaceAsync(Stream faceStream, string contentType, string fileExtension);
    }
}

