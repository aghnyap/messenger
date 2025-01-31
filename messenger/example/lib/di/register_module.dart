import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

import '../generated/message_channel.pbenum.dart';

@module
abstract class RegisterModule {
  @singleton
  MessageBus<MessageChannel> get messageBus =>
      MessageBus<MessageChannel>((channel) => MessageChannel.values.firstWhere(
            (value) => value.name == channel,
            orElse: () => MessageChannel.UNSPECIFIED,
          ));
}
