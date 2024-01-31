using System;
namespace VisualAccess.Domain.Entities
{
    public class FaceRecognitionResult
    {
        public FaceRecognitionResult(uint id, uint statusCode)
        {
            Id = id;
            StatusCode = statusCode;
            Message = "";
        }

        public FaceRecognitionResult(uint id, uint statusCode, string message)
        {
            Id = id;
            StatusCode = statusCode;
            Message = message;
        }

        public uint Id { get; set; }
        public uint StatusCode { get; set; }
        public string Message { get; set; }
    }
}

