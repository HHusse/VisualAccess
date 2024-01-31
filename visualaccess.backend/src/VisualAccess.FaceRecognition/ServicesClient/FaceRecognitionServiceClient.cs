
using Grpc.Core;
using Grpc.Net.Client;
using VisualAccess.Domain.Interfaces.ServicesClient;
using log4net;

using GrpcFaceRecognitionClient = Facerecognition.FaceRecognition.FaceRecognitionClient;
using VisualAccess.Domain.Entities;

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

        public async Task<FaceRecognitionResult> RegisterFaceAsync(MemoryStream faceStream)
        {
            var image = new Facerecognition.Image { Content = Google.Protobuf.ByteString.CopyFrom(faceStream.ToArray()) };
            try
            {
                var response = await grpcClient.RegisterFaceAsync(image);

                log.Info($"gRPC response: Id = {response.Id}, Message = {response.Message}");
                return new FaceRecognitionResult((uint)response.Id, 0, response.Message);
            }
            catch (RpcException e)
            {
                log.Warn($"gRPC response: {e.Status.Detail}");
                return new FaceRecognitionResult(0, (uint)e.StatusCode, e.Status.Detail);
            }
            catch (Exception e)
            {
                log.Error($"Unknown error: {e.Message}");
                return new FaceRecognitionResult(0, (uint)StatusCode.Unknown, e.Message);
            }
        }

        public async Task<FaceRecognitionResult> VerifyFaceAsync(MemoryStream faceStream)
        {
            var image = new Facerecognition.Image { Content = Google.Protobuf.ByteString.CopyFrom(faceStream.ToArray()) };
            try
            {
                var response = await grpcClient.VerifyFaceAsync(image);

                log.Info($"gRPC response: Id = {response.Id}, Message = {response.Message}");
                return new FaceRecognitionResult((uint)response.Id, 0, response.Message);
            }
            catch (RpcException e)
            {
                log.Warn($"gRPC response: {e.Status.Detail}");
                return new FaceRecognitionResult(0, (uint)e.StatusCode, e.Status.Detail);
            }
            catch (Exception e)
            {
                log.Error($"Unknown error: {e.Message}");
                return new FaceRecognitionResult(0, (uint)StatusCode.Unknown, e.Message);
            }
        }
    }
}

