
using Grpc.Core;
using Grpc.Net.Client;
using VisualAccess.Domain.Interfaces.ServicesClient;
using log4net;

using GrpcFaceRecognitionClient = Facerecognition.FaceRecognition.FaceRecognitionClient;
using VisualAccess.Domain.Enumerations;

namespace VisualAccess.FaceRecognition.ServicesClient
{
    public class FaceRecognitionServiceClient : IFaceRecognitionServiceClient
    {
        private readonly ILog log = LogManager.GetLogger(typeof(FaceRecognitionServiceClient).Name);
        private readonly GrpcFaceRecognitionClient grpcClient;

        public FaceRecognitionServiceClient()
        {
            var channel = GrpcChannel.ForAddress(Environment.GetEnvironmentVariable("FACERECOGNITIONURL")!);
            grpcClient = new GrpcFaceRecognitionClient(channel);
        }

        public async Task<(FaceRecognitionResult, int?)> RegisterFaceAsync(MemoryStream faceStream)
        {
            var image = new Facerecognition.Image { Content = Google.Protobuf.ByteString.CopyFrom(faceStream.ToArray()) };
            try
            {
                var response = await grpcClient.RegisterFaceAsync(image);

                log.Info($"gRPC response: Id = {response.Id}, Message = {response.Message}");
                return new(FaceRecognitionResult.OK, response.Id);
            }
            catch (RpcException e)
            {
                log.Warn($"gRPC response: {e.Status.Detail}");
                switch (e.StatusCode)
                {
                    case StatusCode.NotFound:
                        return new(FaceRecognitionResult.NOT_FOUND, null);
                    case StatusCode.AlreadyExists:
                        return new(FaceRecognitionResult.ALREADY_EXIST, null);
                    default:
                        return new(FaceRecognitionResult.UNKNOWN_ERROR, null);

                }
            }
            catch (Exception e)
            {
                log.Error($"Unknown error: {e.Message}");
                return new(FaceRecognitionResult.UNKNOWN_ERROR, null);
            }
        }

        public async Task<(FaceRecognitionResult, int?)> VerifyFaceAsync(MemoryStream faceStream)
        {
            var image = new Facerecognition.Image { Content = Google.Protobuf.ByteString.CopyFrom(faceStream.ToArray()) };
            try
            {
                var response = await grpcClient.VerifyFaceAsync(image);

                log.Info($"gRPC response: Id = {response.Id}, Message = {response.Message}");
                return new(FaceRecognitionResult.OK, response.Id);
            }
            catch (RpcException e)
            {
                log.Warn($"gRPC response: {e.Status.Detail}");
                switch (e.StatusCode)
                {
                    case StatusCode.NotFound:
                        return new(FaceRecognitionResult.NOT_FOUND, null);
                    case StatusCode.OutOfRange:
                        return new(FaceRecognitionResult.NOT_REGISTERD, null);
                    default:
                        return new(FaceRecognitionResult.UNKNOWN_ERROR, null);

                }
            }
            catch (Exception e)
            {
                log.Error($"Unknown error: {e.Message}");
                return new(FaceRecognitionResult.UNKNOWN_ERROR, null);
            }
        }
    }
}

