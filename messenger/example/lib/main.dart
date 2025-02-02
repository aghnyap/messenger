import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart';

import 'di/di.dart';
import 'src/my_app.dart';

void main() {
  Logger.root
    ..level = Level.ALL
    ..onRecord.listen((LogRecord record) {
      debugPrint('${record.level}: [${record.loggerName}] ${record.message}');
    });

  configureDependencies();

  Bloc.observer = GetIt.I<BlocObserver>();
  runApp(const MyApp());
}
