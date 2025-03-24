import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:protobuf/protobuf.dart';

import 'package:messenger/messenger.dart';
import 'package:messenger/generated/message.pb.dart';

enum TestChannel implements ProtobufEnum {
  channelA(0),
  channelB(1);

  const TestChannel(this.value);
  @override
  final int value;

  @override
  String get name => toString();
}

class MockMessage extends Mock implements Message {}

void main() {
  group('MessageBus', () {
    late MessageBus<TestChannel> messageBus;

    setUp(() {
      messageBus = MessageBus<TestChannel>();
      registerFallbackValue(TestChannel.channelA);
      registerFallbackValue(MockMessage());
    });

    tearDown(() async {
      await messageBus.dispose();
    });

    group('constructor', () {
      test('should create a singleton', () async {
        MessageBus<TestChannel> messageBus2 = MessageBus<TestChannel>();
        expect(messageBus, messageBus2);
      });
    });

    group('recieve', () {
      test(
        'should create a new channel if not exist and return a stream',
        () async {
          MockMessage testMessage = MockMessage();

          Stream<MockMessage> stream =
              messageBus.receive<MockMessage>(TestChannel.channelA);

          List<MockMessage> receivedMessages = <MockMessage>[];

          StreamSubscription<MockMessage> subscription =
              stream.listen(receivedMessages.add);

          messageBus.dispatch(TestChannel.channelA, testMessage);

          expect(receivedMessages, contains(testMessage));

          await subscription.cancel();
        },
      );

      test('should return a stream that only emits message of type E', () {});

      test('should filter out incorrect message types', () {});
    });

    test('should receive a dispatched message', () async {
      MockMessage testMessage = MockMessage();

      Stream<Message> stream =
          messageBus.receive<Message>(TestChannel.channelA);

      List<Message> receivedMessages = <Message>[];

      StreamSubscription<Message> subscription =
          stream.listen(receivedMessages.add);

      messageBus.dispatch(TestChannel.channelA, testMessage);

      await Future<Duration>.delayed(const Duration(milliseconds: 100));

      expect(receivedMessages, contains(testMessage));

      await subscription.cancel();
    });

    // test('should not receive messages of different types', () async {
    //   MockMessage testMessage = MockMessage();

    //   Stream<dynamic> stream =
    //       messageBus.receive<AnotherMessageType>(TestChannel.channelA);
    //   List<dynamic> receivedMessages = <AnotherMessageType>[];

    //   StreamSubscription<dynamic> subscription =
    //       stream.listen(receivedMessages.add);

    //   messageBus.dispatch(TestChannel.channelA, testMessage);

    //   await Future<Duration>.delayed(const Duration(milliseconds: 100));

    //   expect(receivedMessages, isEmpty);

    //   await subscription.cancel();
    // });

    test('should dispose of channels properly', () async {
      MockMessage testMessage = MockMessage();

      messageBus.dispatch(TestChannel.channelA, testMessage);
      await messageBus.disposeChannel(TestChannel.channelA);

      await expectLater(
        messageBus.receive<Message>(TestChannel.channelA),
        emitsDone,
      );
    });
  });
}
