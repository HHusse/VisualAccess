# Generated by the gRPC Python protocol compiler plugin. DO NOT EDIT!
"""Client and server classes corresponding to protobuf-defined services."""
import grpc

import facerecognition_pb2 as facerecognition__pb2


class FaceRecognitionStub(object):
    """Missing associated documentation comment in .proto file."""

    def __init__(self, channel):
        """Constructor.

        Args:
            channel: A grpc.Channel.
        """
        self.RegisterFace = channel.unary_unary(
                '/facerecognition.FaceRecognition/RegisterFace',
                request_serializer=facerecognition__pb2.Image.SerializeToString,
                response_deserializer=facerecognition__pb2.RegisterFaceResponse.FromString,
                )
        self.VerifyFace = channel.unary_unary(
                '/facerecognition.FaceRecognition/VerifyFace',
                request_serializer=facerecognition__pb2.Image.SerializeToString,
                response_deserializer=facerecognition__pb2.VerifyFaceResponse.FromString,
                )
        self.RefreshCache = channel.unary_unary(
                '/facerecognition.FaceRecognition/RefreshCache',
                request_serializer=facerecognition__pb2.Empty.SerializeToString,
                response_deserializer=facerecognition__pb2.Empty.FromString,
                )


class FaceRecognitionServicer(object):
    """Missing associated documentation comment in .proto file."""

    def RegisterFace(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def VerifyFace(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')

    def RefreshCache(self, request, context):
        """Missing associated documentation comment in .proto file."""
        context.set_code(grpc.StatusCode.UNIMPLEMENTED)
        context.set_details('Method not implemented!')
        raise NotImplementedError('Method not implemented!')


def add_FaceRecognitionServicer_to_server(servicer, server):
    rpc_method_handlers = {
            'RegisterFace': grpc.unary_unary_rpc_method_handler(
                    servicer.RegisterFace,
                    request_deserializer=facerecognition__pb2.Image.FromString,
                    response_serializer=facerecognition__pb2.RegisterFaceResponse.SerializeToString,
            ),
            'VerifyFace': grpc.unary_unary_rpc_method_handler(
                    servicer.VerifyFace,
                    request_deserializer=facerecognition__pb2.Image.FromString,
                    response_serializer=facerecognition__pb2.VerifyFaceResponse.SerializeToString,
            ),
            'RefreshCache': grpc.unary_unary_rpc_method_handler(
                    servicer.RefreshCache,
                    request_deserializer=facerecognition__pb2.Empty.FromString,
                    response_serializer=facerecognition__pb2.Empty.SerializeToString,
            ),
    }
    generic_handler = grpc.method_handlers_generic_handler(
            'facerecognition.FaceRecognition', rpc_method_handlers)
    server.add_generic_rpc_handlers((generic_handler,))


 # This class is part of an EXPERIMENTAL API.
class FaceRecognition(object):
    """Missing associated documentation comment in .proto file."""

    @staticmethod
    def RegisterFace(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/facerecognition.FaceRecognition/RegisterFace',
            facerecognition__pb2.Image.SerializeToString,
            facerecognition__pb2.RegisterFaceResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def VerifyFace(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/facerecognition.FaceRecognition/VerifyFace',
            facerecognition__pb2.Image.SerializeToString,
            facerecognition__pb2.VerifyFaceResponse.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)

    @staticmethod
    def RefreshCache(request,
            target,
            options=(),
            channel_credentials=None,
            call_credentials=None,
            insecure=False,
            compression=None,
            wait_for_ready=None,
            timeout=None,
            metadata=None):
        return grpc.experimental.unary_unary(request, target, '/facerecognition.FaceRecognition/RefreshCache',
            facerecognition__pb2.Empty.SerializeToString,
            facerecognition__pb2.Empty.FromString,
            options, channel_credentials,
            insecure, call_credentials, compression, wait_for_ready, timeout, metadata)
