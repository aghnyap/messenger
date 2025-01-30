//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageDescriptor instead')
const Message$json = {
  '1': 'Message',
  '2': [
    {'1': 'correlation_id', '3': 1, '4': 1, '5': 9, '10': 'correlationId'},
    {'1': 'source_id', '3': 2, '4': 1, '5': 9, '10': 'sourceId'},
    {'1': 'destination_id', '3': 3, '4': 1, '5': 9, '10': 'destinationId'},
    {'1': 'channel', '3': 4, '4': 1, '5': 9, '10': 'channel'},
    {'1': 'request', '3': 5, '4': 1, '5': 11, '6': '.Request', '9': 0, '10': 'request'},
    {'1': 'response', '3': 6, '4': 1, '5': 11, '6': '.Response', '9': 0, '10': 'response'},
    {'1': 'broadcast', '3': 7, '4': 1, '5': 11, '6': '.Broadcast', '9': 0, '10': 'broadcast'},
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEiUKDmNvcnJlbGF0aW9uX2lkGAEgASgJUg1jb3JyZWxhdGlvbklkEhsKCXNvdX'
    'JjZV9pZBgCIAEoCVIIc291cmNlSWQSJQoOZGVzdGluYXRpb25faWQYAyABKAlSDWRlc3RpbmF0'
    'aW9uSWQSGAoHY2hhbm5lbBgEIAEoCVIHY2hhbm5lbBIkCgdyZXF1ZXN0GAUgASgLMgguUmVxdW'
    'VzdEgAUgdyZXF1ZXN0EicKCHJlc3BvbnNlGAYgASgLMgkuUmVzcG9uc2VIAFIIcmVzcG9uc2US'
    'KgoJYnJvYWRjYXN0GAcgASgLMgouQnJvYWRjYXN0SABSCWJyb2FkY2FzdEIGCgR0eXBl');

@$core.Deprecated('Use requestDescriptor instead')
const Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.Request.ParametersEntry', '10': 'parameters'},
    {'1': 'raw_data', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'rawData'},
  ],
  '3': [Request_ParametersEntry$json],
  '8': [
    {'1': 'data'},
  ],
};

@$core.Deprecated('Use requestDescriptor instead')
const Request_ParametersEntry$json = {
  '1': 'ParametersEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Request`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDescriptor = $convert.base64Decode(
    'CgdSZXF1ZXN0EhIKBGNvZGUYASABKAlSBGNvZGUSOAoKcGFyYW1ldGVycxgCIAMoCzIYLlJlcX'
    'Vlc3QuUGFyYW1ldGVyc0VudHJ5UgpwYXJhbWV0ZXJzEhsKCHJhd19kYXRhGAMgASgMSABSB3Jh'
    'd0RhdGEaPQoPUGFyYW1ldGVyc0VudHJ5EhAKA2tleRgBIAEoCVIDa2V5EhQKBXZhbHVlGAIgAS'
    'gJUgV2YWx1ZToCOAFCBgoEZGF0YQ==');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'raw_data', '3': 4, '4': 1, '5': 12, '9': 0, '10': 'rawData'},
  ],
  '8': [
    {'1': 'data'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRISCgRjb2RlGAEgASgJUgRjb2RlEhgKB3N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3'
    'MSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIbCghyYXdfZGF0YRgEIAEoDEgAUgdyYXdEYXRh'
    'QgYKBGRhdGE=');

@$core.Deprecated('Use broadcastDescriptor instead')
const Broadcast$json = {
  '1': 'Broadcast',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'metadata', '3': 2, '4': 3, '5': 11, '6': '.Broadcast.MetadataEntry', '10': 'metadata'},
    {'1': 'raw_data', '3': 3, '4': 1, '5': 12, '9': 0, '10': 'rawData'},
  ],
  '3': [Broadcast_MetadataEntry$json],
  '8': [
    {'1': 'data'},
  ],
};

@$core.Deprecated('Use broadcastDescriptor instead')
const Broadcast_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Broadcast`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List broadcastDescriptor = $convert.base64Decode(
    'CglCcm9hZGNhc3QSFAoFZXZlbnQYASABKAlSBWV2ZW50EjQKCG1ldGFkYXRhGAIgAygLMhguQn'
    'JvYWRjYXN0Lk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhEhsKCHJhd19kYXRhGAMgASgMSABSB3Jh'
    'd0RhdGEaOwoNTWV0YWRhdGFFbnRyeRIQCgNrZXkYASABKAlSA2tleRIUCgV2YWx1ZRgCIAEoCV'
    'IFdmFsdWU6AjgBQgYKBGRhdGE=');

