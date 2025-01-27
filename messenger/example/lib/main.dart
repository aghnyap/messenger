import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/counter_observer.dart';
import 'src/my_app.dart';

void main() {
  Bloc.observer = const CounterObserver();
  runApp(const MyApp());
}
