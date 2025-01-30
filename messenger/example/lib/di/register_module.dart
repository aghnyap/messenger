import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

@module
abstract class RegisterModule {
  @singleton
  MessageBus get messageBus => MessageBus();
}
