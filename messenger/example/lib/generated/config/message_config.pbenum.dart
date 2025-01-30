//
//  Generated code. Do not modify.
//  source: config/message_config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum to define standard message channels
class MessageChannel extends $pb.ProtobufEnum {
  static const MessageChannel unknown = MessageChannel._(0, _omitEnumNames ? '' : 'unknown');
  static const MessageChannel counter = MessageChannel._(1, _omitEnumNames ? '' : 'counter');
  static const MessageChannel timer = MessageChannel._(2, _omitEnumNames ? '' : 'timer');

  static const $core.List<MessageChannel> values = <MessageChannel> [
    unknown,
    counter,
    timer,
  ];

  static final $core.Map<$core.int, MessageChannel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageChannel? valueOf($core.int value) => _byValue[value];

  const MessageChannel._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
