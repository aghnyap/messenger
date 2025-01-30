import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

import '../../generated/timer/timer.pb.dart' as pb;

@singleton
final class TimerService extends MessageService {
  StreamSubscription? _subscription;

  TimerService(super.messageBus)
      : super(
          incomingChannels: ['counter'],
          outgoingChannel: 'timer',
        ) {
    _startTimer();
  }

  @override
  void handle(Message message) async {
    if (!message.hasResponse()) return;

    switch (message.response.code) {
      case 'increment':
      case 'decrement':
        _resetTimer();
        break;
      default:
        logger.warning("Unhandled response: ${message.response.code}");
    }
  }

  void _startTimer() {
    if (_subscription != null) {
      logger.warning("Timer already running.");
      return;
    }

    logger.info("Timer started. Broadcasting every 1 second.");
    _subscription = Stream.periodic(const Duration(seconds: 1), (ticks) {
      return pb.Timer()..ticks = ++ticks;
    }).listen(_broadcastTimer);
  }

  void _resetTimer() async {
    logger.info("Resetting Timer...");
    await _subscription?.cancel();
    _subscription = null;
    _startTimer();
  }

  void _broadcastTimer(pb.Timer timer) {
    logger.info("Broadcasting timer message: ${timer.ticks}");

    final broadcastMessage = Message()
      ..channel = 'timer'
      ..broadcast = (Broadcast()..rawData = timer.writeToBuffer());

    dispatch(broadcastMessage);
  }

  @override
  Future<void> dispose() async {
    await _subscription?.cancel();
    _subscription = null;
    logger.info("TimerService Stopped.");
  }
}
