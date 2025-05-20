import 'package:bloc_playlist/blocs/events/counter_event.dart';
import 'package:bloc_playlist/states/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/all_bloc/counter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App', style: TextStyle(fontSize: 20)), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, states) {
              return Text('${states.counter.toString()}', style: TextStyle(fontSize: 25));
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(IncrementCounter());
                },
                color: Colors.green,
                child: Center(child: Text('Increment')),
              ),
              MaterialButton(
                onPressed: () {
                  context.read<CounterBloc>().add(DecrementCounter());
                 },
                color: Colors.red,
                child: Center(child: Text('Decrement')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
