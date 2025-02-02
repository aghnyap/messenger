import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';

/// {@template counter_observer}
/// [BlocObserver] for the counter application which
/// observes all state changes.
/// {@endtemplate}
final Logger logger = Logger('BlocObserver');

@Singleton(as: BlocObserver)
class MyAppBlocObserver extends BlocObserver {
  /// {@macro counter_observer}
  const MyAppBlocObserver();

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    logger.info('[${bloc.runtimeType}] $transition');
  }
}
