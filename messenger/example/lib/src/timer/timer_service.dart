import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:messenger/generated/google/protobuf/any.pb.dart';
import 'package:messenger/generated/message.pb.dart';
import 'package:messenger/messenger.dart';

import '../../generated/message_channel.pbenum.dart';
import '../../generated/timer/timer.pb.dart' as pb;

@singleton
final class TimerService extends MessageService<MessageChannel> {
  StreamSubscription? _subscription;

  TimerService(super.messageBus)
      : super(
          incomingChannels: [
            MessageChannel.COUNTER,
          ],
          outgoingChannel: MessageChannel.TIMER,
        ) {
    _startTimer();
  }

  @override
  void handleResponse(MessageChannel channel, Response response) async {
    switch (response.code) {
      case 'increment':
      case 'decrement':
        _resetTimer();
        break;
      default:
        logger.warning("Unhandled response: ${response.code}");
    }
  }

  void _startTimer() {
    if (_subscription != null) {
      logger.warning("Timer already running.");
      return;
    }

    _subscription = Stream.periodic(
      const Duration(seconds: 1),
      (ticks) => pb.Timer()..ticks = ++ticks,
    ).listen(_broadcastTimer);
  }

  void _resetTimer() async {
    logger.info("Resetting Timer...");
    await _subscription?.cancel();
    _subscription = null;
    _startTimer();
  }

  void _broadcastTimer(pb.Timer timer) {
    dispatch(Message()..broadcast = (Broadcast()..data = Any.pack(timer)));
    logger.info("Broadcasting timer message: ${timer.ticks}");
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    logger.info("TimerService Stopped.");
  }
}
