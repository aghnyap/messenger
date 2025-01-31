//
//  Generated code. Do not modify.
//  source: config/message_channel.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use messageChannelDescriptor instead')
const MessageChannel$json = {
  '1': 'MessageChannel',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'COUNTER', '2': 1},
    {'1': 'TIMER', '2': 2},
  ],
};

/// Descriptor for `MessageChannel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List messageChannelDescriptor = $convert.base64Decode(
    'Cg5NZXNzYWdlQ2hhbm5lbBILCgdVTktOT1dOEAASCwoHQ09VTlRFUhABEgkKBVRJTUVSEAI=');

