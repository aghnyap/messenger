import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import 'src/my_app.dart';

void main() {
  Logger.root
    ..level = Level.ALL
    ..onRecord.listen(
      (LogRecord record) => debugPrint(
        '${record.level}: [${record.loggerName}] ${record.message}',
      ),
    );

  runApp(const MyApp());
}
