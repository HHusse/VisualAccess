# -*- coding: utf-8 -*-
# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: facerecognition.proto
# Protobuf Python Version: 4.25.0
"""Generated protocol buffer code."""
from google.protobuf import descriptor as _descriptor
from google.protobuf import descriptor_pool as _descriptor_pool
from google.protobuf import symbol_database as _symbol_database
from google.protobuf.internal import builder as _builder
# @@protoc_insertion_point(imports)

_sym_db = _symbol_database.Default()




DESCRIPTOR = _descriptor_pool.Default().AddSerializedFile(b'\n\x15\x66\x61\x63\x65recognition.proto\x12\x0f\x66\x61\x63\x65recognition\"\x07\n\x05\x45mpty\"\x18\n\x05Image\x12\x0f\n\x07\x63ontent\x18\x01 \x01(\x0c\"3\n\x14RegisterFaceResponse\x12\n\n\x02id\x18\x01 \x01(\x05\x12\x0f\n\x07message\x18\x02 \x01(\t\"1\n\x12VerifyFaceResponse\x12\n\n\x02id\x18\x01 \x01(\x05\x12\x0f\n\x07message\x18\x02 \x01(\t2\xf1\x01\n\x0f\x46\x61\x63\x65Recognition\x12O\n\x0cRegisterFace\x12\x16.facerecognition.Image\x1a%.facerecognition.RegisterFaceResponse\"\x00\x12K\n\nVerifyFace\x12\x16.facerecognition.Image\x1a#.facerecognition.VerifyFaceResponse\"\x00\x12@\n\x0cRefreshCache\x12\x16.facerecognition.Empty\x1a\x16.facerecognition.Empty\"\x00\x62\x06proto3')

_globals = globals()
_builder.BuildMessageAndEnumDescriptors(DESCRIPTOR, _globals)
_builder.BuildTopDescriptorsAndMessages(DESCRIPTOR, 'facerecognition_pb2', _globals)
if _descriptor._USE_C_DESCRIPTORS == False:
  DESCRIPTOR._options = None
  _globals['_EMPTY']._serialized_start=42
  _globals['_EMPTY']._serialized_end=49
  _globals['_IMAGE']._serialized_start=51
  _globals['_IMAGE']._serialized_end=75
  _globals['_REGISTERFACERESPONSE']._serialized_start=77
  _globals['_REGISTERFACERESPONSE']._serialized_end=128
  _globals['_VERIFYFACERESPONSE']._serialized_start=130
  _globals['_VERIFYFACERESPONSE']._serialized_end=179
  _globals['_FACERECOGNITION']._serialized_start=182
  _globals['_FACERECOGNITION']._serialized_end=423
# @@protoc_insertion_point(module_scope)