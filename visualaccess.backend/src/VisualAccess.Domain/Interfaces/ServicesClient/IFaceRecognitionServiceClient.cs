using System;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.Domain.Interfaces.ServicesClient
{
    public interface IFaceRecognitionServiceClient
    {
        public Task<(FaceRecognitionResult, int?)> RegisterFaceAsync(MemoryStream faceStream);
        public Task<(FaceRecognitionResult, int?)> VerifyFaceAsync(MemoryStream faceStream);
    }
}

