import 'package:bloc_playlist/home_view.dart';
import 'package:bloc_playlist/swtich_example/example_two.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/all_bloc/counter_bloc.dart';
import 'blocs/all_bloc/switch_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CounterBloc(),
        ),
        BlocProvider(
          create: (_) => SwitchBloc(),
        ),
      ],
      child: MaterialApp(home: ExampleTwo(), debugShowCheckedModeBanner: false),
    );
  }
}
