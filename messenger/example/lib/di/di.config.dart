// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc/bloc.dart' as _i923;
import 'package:example/di/register_module.dart' as _i820;
import 'package:example/generated/message_channel.pbenum.dart' as _i759;
import 'package:example/src/counter/counter.dart' as _i467;
import 'package:example/src/counter/counter_cubit.dart' as _i635;
import 'package:example/src/counter/counter_service.dart' as _i773;
import 'package:example/src/my_app_bloc_observer.dart' as _i300;
import 'package:example/src/timer/timer_service.dart' as _i71;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:messenger/messenger.dart' as _i238;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.singleton<_i238.MessageBus<_i759.MessageChannel>>(
        () => registerModule.messageBus);
    gh.singleton<_i467.Counter>(() => const _i467.Counter());
    gh.singleton<_i923.BlocObserver>(() => const _i300.MyAppBlocObserver());
    gh.singleton<_i773.CounterService>(() => _i773.CounterService(
          gh<_i238.MessageBus<_i759.MessageChannel>>(),
          gh<_i467.Counter>(),
        ));
    gh.factory<_i635.CounterCubit>(
        () => _i635.CounterCubit(gh<_i238.MessageBus<_i759.MessageChannel>>()));
    gh.singleton<_i71.TimerService>(
        () => _i71.TimerService(gh<_i238.MessageBus<_i759.MessageChannel>>()));
    return this;
  }
}

class _$RegisterModule extends _i820.RegisterModule {}
