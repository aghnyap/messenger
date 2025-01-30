import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

import '../generated/config/message_config.pb.dart';

@module
abstract class RegisterModule {
  @singleton
  MessageBus<Message, MessageChannel> get messageBus =>
      MessageBus<Message, MessageChannel>();
}
