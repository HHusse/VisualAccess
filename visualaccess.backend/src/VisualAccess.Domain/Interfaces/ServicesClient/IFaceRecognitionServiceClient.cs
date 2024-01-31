using System;
using VisualAccess.Domain.Entities;

namespace VisualAccess.Domain.Interfaces.ServicesClient
{
    public interface IFaceRecognitionServiceClient
    {
        public Task<FaceRecognitionResult> RegisterFaceAsync(MemoryStream faceStream);
        public Task<FaceRecognitionResult> VerifyFaceAsync(MemoryStream faceStream);
    }
}

