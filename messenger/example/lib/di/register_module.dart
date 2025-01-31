import 'package:injectable/injectable.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../generated/config/message_channel.pb.dart';

@module
abstract class RegisterModule {
  @singleton
  MessageBus<Message, MessageChannel> get messageBus =>
      MessageBus<Message, MessageChannel>();
}
