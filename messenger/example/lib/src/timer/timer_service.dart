import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:messenger/messenger.dart';

import '../../generated/timer/timer.pb.dart' as pb;

@singleton
final class TimerService extends MessageService {
  late final StreamSubscription _subscription;

  TimerService(super.messageBus)
      : super(
          incomingChannels: [],
          outgoingChannel: 'timer',
        ) {
    _startTimer();
  }

  @override
  void handle(Message message) {}

  void _startTimer() {
    logger.info("TimerService started. Broadcasting every 1 second.");
    _subscription = Stream.periodic(const Duration(seconds: 1), (count) {
      return pb.Timer()..ticks = count + 1;
    }).listen((timer) {
      logger.info("Broadcasting timer message: ${timer.ticks}");

      final broadcastMessage = Message()
        ..channel = 'timer'
        ..broadcast = (Broadcast()..rawData = timer.writeToBuffer());

      dispatch(broadcastMessage);
    });
  }

  @override
  Future<void> dispose() async {
    await _subscription.cancel();
    logger.info("Stopped.");
    super.dispose();
  }
}
