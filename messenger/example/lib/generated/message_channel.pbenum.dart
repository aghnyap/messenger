//
//  Generated code. Do not modify.
//  source: message_channel.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MessageChannel extends $pb.ProtobufEnum {
  static const MessageChannel UNSPECIFIED = MessageChannel._(0, _omitEnumNames ? '' : 'UNSPECIFIED');
  static const MessageChannel COUNTER = MessageChannel._(1, _omitEnumNames ? '' : 'COUNTER');
  static const MessageChannel TIMER = MessageChannel._(2, _omitEnumNames ? '' : 'TIMER');

  static const $core.List<MessageChannel> values = <MessageChannel> [
    UNSPECIFIED,
    COUNTER,
    TIMER,
  ];

  static final $core.Map<$core.int, MessageChannel> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MessageChannel? valueOf($core.int value) => _byValue[value];

  const MessageChannel._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
