//
//  Generated code. Do not modify.
//  source: message.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $1;
import 'google/protobuf/timestamp.pb.dart' as $0;

enum Message_Type {
  request, 
  response, 
  broadcast, 
  notSet
}

/// ----------- BASE MESSAGE -----------
class Message extends $pb.GeneratedMessage {
  factory Message({
    $core.String? correlationId,
    $core.String? sourceId,
    $core.String? destinationId,
    $core.String? channelName,
    $core.int? channelValue,
    $0.Timestamp? timestamp,
    Request? request,
    Response? response,
    Broadcast? broadcast,
  }) {
    final $result = create();
    if (correlationId != null) {
      $result.correlationId = correlationId;
    }
    if (sourceId != null) {
      $result.sourceId = sourceId;
    }
    if (destinationId != null) {
      $result.destinationId = destinationId;
    }
    if (channelName != null) {
      $result.channelName = channelName;
    }
    if (channelValue != null) {
      $result.channelValue = channelValue;
    }
    if (timestamp != null) {
      $result.timestamp = timestamp;
    }
    if (request != null) {
      $result.request = request;
    }
    if (response != null) {
      $result.response = response;
    }
    if (broadcast != null) {
      $result.broadcast = broadcast;
    }
    return $result;
  }
  Message._() : super();
  factory Message.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Message.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Message_Type> _Message_TypeByTag = {
    7 : Message_Type.request,
    8 : Message_Type.response,
    9 : Message_Type.broadcast,
    0 : Message_Type.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Message', createEmptyInstance: create)
    ..oo(0, [7, 8, 9])
    ..aOS(1, _omitFieldNames ? '' : 'correlationId')
    ..aOS(2, _omitFieldNames ? '' : 'sourceId')
    ..aOS(3, _omitFieldNames ? '' : 'destinationId')
    ..aOS(4, _omitFieldNames ? '' : 'channelName')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'channelValue', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'timestamp', subBuilder: $0.Timestamp.create)
    ..aOM<Request>(7, _omitFieldNames ? '' : 'request', subBuilder: Request.create)
    ..aOM<Response>(8, _omitFieldNames ? '' : 'response', subBuilder: Response.create)
    ..aOM<Broadcast>(9, _omitFieldNames ? '' : 'broadcast', subBuilder: Broadcast.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Message clone() => Message()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Message copyWith(void Function(Message) updates) => super.copyWith((message) => updates(message as Message)) as Message;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Message create() => Message._();
  Message createEmptyInstance() => create();
  static $pb.PbList<Message> createRepeated() => $pb.PbList<Message>();
  @$core.pragma('dart2js:noInline')
  static Message getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Message>(create);
  static Message? _defaultInstance;

  Message_Type whichType() => _Message_TypeByTag[$_whichOneof(0)]!;
  void clearType() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get correlationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set correlationId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCorrelationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCorrelationId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get sourceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sourceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSourceId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get destinationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set destinationId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDestinationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestinationId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get channelName => $_getSZ(3);
  @$pb.TagNumber(4)
  set channelName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasChannelName() => $_has(3);
  @$pb.TagNumber(4)
  void clearChannelName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get channelValue => $_getIZ(4);
  @$pb.TagNumber(5)
  set channelValue($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasChannelValue() => $_has(4);
  @$pb.TagNumber(5)
  void clearChannelValue() => clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get timestamp => $_getN(5);
  @$pb.TagNumber(6)
  set timestamp($0.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasTimestamp() => $_has(5);
  @$pb.TagNumber(6)
  void clearTimestamp() => clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureTimestamp() => $_ensure(5);

  @$pb.TagNumber(7)
  Request get request => $_getN(6);
  @$pb.TagNumber(7)
  set request(Request v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasRequest() => $_has(6);
  @$pb.TagNumber(7)
  void clearRequest() => clearField(7);
  @$pb.TagNumber(7)
  Request ensureRequest() => $_ensure(6);

  @$pb.TagNumber(8)
  Response get response => $_getN(7);
  @$pb.TagNumber(8)
  set response(Response v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasResponse() => $_has(7);
  @$pb.TagNumber(8)
  void clearResponse() => clearField(8);
  @$pb.TagNumber(8)
  Response ensureResponse() => $_ensure(7);

  @$pb.TagNumber(9)
  Broadcast get broadcast => $_getN(8);
  @$pb.TagNumber(9)
  set broadcast(Broadcast v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasBroadcast() => $_has(8);
  @$pb.TagNumber(9)
  void clearBroadcast() => clearField(9);
  @$pb.TagNumber(9)
  Broadcast ensureBroadcast() => $_ensure(8);
}

/// / ----------- REQUEST MESSAGE -----------
/// / Purpose: Request data or results from a listener.
/// / Expectation: A listener must response with the result via a Response message.
/// / Example: "Get user profile" → Reply with user data.
class Request extends $pb.GeneratedMessage {
  factory Request({
    $core.String? code,
    $core.Map<$core.String, $core.String>? parameters,
    $1.Any? data,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (parameters != null) {
      $result.parameters.addAll(parameters);
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  Request._() : super();
  factory Request.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Request.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Request', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'parameters', entryClassName: 'Request.ParametersEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOM<$1.Any>(3, _omitFieldNames ? '' : 'data', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Request clone() => Request()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Request copyWith(void Function(Request) updates) => super.copyWith((message) => updates(message as Request)) as Request;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Request create() => Request._();
  Request createEmptyInstance() => create();
  static $pb.PbList<Request> createRepeated() => $pb.PbList<Request>();
  @$core.pragma('dart2js:noInline')
  static Request getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Request>(create);
  static Request? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get parameters => $_getMap(1);

  @$pb.TagNumber(3)
  $1.Any get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($1.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $1.Any ensureData() => $_ensure(2);
}

/// / ----------- RESPONSE MESSAGE -----------
/// / Purpose: A response to a Request indicating success, failure, or data.
/// / Expectation: Only emitted as a response; never used directly as an action.
/// / Example: "Email sent successfully" or "User profile data".
class Response extends $pb.GeneratedMessage {
  factory Response({
    $core.String? code,
    $core.bool? success,
    $core.String? message,
    $1.Any? data,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (success != null) {
      $result.success = success;
    }
    if (message != null) {
      $result.message = message;
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  Response._() : super();
  factory Response.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Response.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Response', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'code')
    ..aOB(2, _omitFieldNames ? '' : 'success')
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..aOM<$1.Any>(4, _omitFieldNames ? '' : 'data', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Response clone() => Response()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Response copyWith(void Function(Response) updates) => super.copyWith((message) => updates(message as Response)) as Response;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Response create() => Response._();
  Response createEmptyInstance() => create();
  static $pb.PbList<Response> createRepeated() => $pb.PbList<Response>();
  @$core.pragma('dart2js:noInline')
  static Response getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Response>(create);
  static Response? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get code => $_getSZ(0);
  @$pb.TagNumber(1)
  set code($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  @$pb.TagNumber(2)
  $core.bool get success => $_getBF(1);
  @$pb.TagNumber(2)
  set success($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSuccess() => $_has(1);
  @$pb.TagNumber(2)
  void clearSuccess() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $1.Any get data => $_getN(3);
  @$pb.TagNumber(4)
  set data($1.Any v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasData() => $_has(3);
  @$pb.TagNumber(4)
  void clearData() => clearField(4);
  @$pb.TagNumber(4)
  $1.Any ensureData() => $_ensure(3);
}

/// / ----------- BROADCAST MESSAGE -----------
/// / Purpose: Broadcast information without expecting a response (fire-and-forget).
/// / Expectation: No response expected, but multiple listeners may act on it.
/// / Example: "User logged out" → No acknowledgment required.
class Broadcast extends $pb.GeneratedMessage {
  factory Broadcast({
    $core.String? event,
    $core.Map<$core.String, $core.String>? metadata,
    $1.Any? data,
  }) {
    final $result = create();
    if (event != null) {
      $result.event = event;
    }
    if (metadata != null) {
      $result.metadata.addAll(metadata);
    }
    if (data != null) {
      $result.data = data;
    }
    return $result;
  }
  Broadcast._() : super();
  factory Broadcast.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Broadcast.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Broadcast', createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'event')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'metadata', entryClassName: 'Broadcast.MetadataEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS)
    ..aOM<$1.Any>(3, _omitFieldNames ? '' : 'data', subBuilder: $1.Any.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Broadcast clone() => Broadcast()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Broadcast copyWith(void Function(Broadcast) updates) => super.copyWith((message) => updates(message as Broadcast)) as Broadcast;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Broadcast create() => Broadcast._();
  Broadcast createEmptyInstance() => create();
  static $pb.PbList<Broadcast> createRepeated() => $pb.PbList<Broadcast>();
  @$core.pragma('dart2js:noInline')
  static Broadcast getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Broadcast>(create);
  static Broadcast? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get event => $_getSZ(0);
  @$pb.TagNumber(1)
  set event($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEvent() => $_has(0);
  @$pb.TagNumber(1)
  void clearEvent() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get metadata => $_getMap(1);

  @$pb.TagNumber(3)
  $1.Any get data => $_getN(2);
  @$pb.TagNumber(3)
  set data($1.Any v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasData() => $_has(2);
  @$pb.TagNumber(3)
  void clearData() => clearField(3);
  @$pb.TagNumber(3)
  $1.Any ensureData() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
