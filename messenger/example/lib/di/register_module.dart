import 'package:injectable/injectable.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

@module
abstract class RegisterModule {
  @singleton
  MessageBus<Message> get messageBus => MessageBus<Message>();
}
