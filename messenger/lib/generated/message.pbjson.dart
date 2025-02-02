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
    {'1': 'channel_name', '3': 4, '4': 1, '5': 9, '10': 'channelName'},
    {'1': 'channel_value', '3': 5, '4': 1, '5': 5, '10': 'channelValue'},
    {'1': 'timestamp', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'timestamp'},
    {'1': 'request', '3': 7, '4': 1, '5': 11, '6': '.Request', '9': 0, '10': 'request'},
    {'1': 'response', '3': 8, '4': 1, '5': 11, '6': '.Response', '9': 0, '10': 'response'},
    {'1': 'broadcast', '3': 9, '4': 1, '5': 11, '6': '.Broadcast', '9': 0, '10': 'broadcast'},
  ],
  '8': [
    {'1': 'type'},
  ],
};

/// Descriptor for `Message`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageDescriptor = $convert.base64Decode(
    'CgdNZXNzYWdlEiUKDmNvcnJlbGF0aW9uX2lkGAEgASgJUg1jb3JyZWxhdGlvbklkEhsKCXNvdX'
    'JjZV9pZBgCIAEoCVIIc291cmNlSWQSJQoOZGVzdGluYXRpb25faWQYAyABKAlSDWRlc3RpbmF0'
    'aW9uSWQSIQoMY2hhbm5lbF9uYW1lGAQgASgJUgtjaGFubmVsTmFtZRIjCg1jaGFubmVsX3ZhbH'
    'VlGAUgASgFUgxjaGFubmVsVmFsdWUSOAoJdGltZXN0YW1wGAYgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIJdGltZXN0YW1wEiQKB3JlcXVlc3QYByABKAsyCC5SZXF1ZXN0SABSB3'
    'JlcXVlc3QSJwoIcmVzcG9uc2UYCCABKAsyCS5SZXNwb25zZUgAUghyZXNwb25zZRIqCglicm9h'
    'ZGNhc3QYCSABKAsyCi5Ccm9hZGNhc3RIAFIJYnJvYWRjYXN0QgYKBHR5cGU=');

@$core.Deprecated('Use requestDescriptor instead')
const Request$json = {
  '1': 'Request',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'parameters', '3': 2, '4': 3, '5': 11, '6': '.Request.ParametersEntry', '10': 'parameters'},
    {'1': 'data', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'data'},
  ],
  '3': [Request_ParametersEntry$json],
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
    'Vlc3QuUGFyYW1ldGVyc0VudHJ5UgpwYXJhbWV0ZXJzEigKBGRhdGEYAyABKAsyFC5nb29nbGUu'
    'cHJvdG9idWYuQW55UgRkYXRhGj0KD1BhcmFtZXRlcnNFbnRyeRIQCgNrZXkYASABKAlSA2tleR'
    'IUCgV2YWx1ZRgCIAEoCVIFdmFsdWU6AjgB');

@$core.Deprecated('Use responseDescriptor instead')
const Response$json = {
  '1': 'Response',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'success', '3': 2, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    {'1': 'data', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'data'},
  ],
};

/// Descriptor for `Response`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List responseDescriptor = $convert.base64Decode(
    'CghSZXNwb25zZRISCgRjb2RlGAEgASgJUgRjb2RlEhgKB3N1Y2Nlc3MYAiABKAhSB3N1Y2Nlc3'
    'MSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIoCgRkYXRhGAQgASgLMhQuZ29vZ2xlLnByb3Rv'
    'YnVmLkFueVIEZGF0YQ==');

@$core.Deprecated('Use broadcastDescriptor instead')
const Broadcast$json = {
  '1': 'Broadcast',
  '2': [
    {'1': 'event', '3': 1, '4': 1, '5': 9, '10': 'event'},
    {'1': 'metadata', '3': 2, '4': 3, '5': 11, '6': '.Broadcast.MetadataEntry', '10': 'metadata'},
    {'1': 'data', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Any', '10': 'data'},
  ],
  '3': [Broadcast_MetadataEntry$json],
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
    'JvYWRjYXN0Lk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhEigKBGRhdGEYAyABKAsyFC5nb29nbGUu'
    'cHJvdG9idWYuQW55UgRkYXRhGjsKDU1ldGFkYXRhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFA'
    'oFdmFsdWUYAiABKAlSBXZhbHVlOgI4AQ==');

