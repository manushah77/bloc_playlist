import 'package:bloc_playlist/blocs/events/switch_event.dart';
import 'package:bloc_playlist/states/swith_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/all_bloc/switch_bloc.dart';

class ExampleTwo extends StatefulWidget {
  const ExampleTwo({super.key});

  @override
  State<ExampleTwo> createState() => _ExampleTwoState();
}

class _ExampleTwoState extends State<ExampleTwo> {
  @override
  Widget build(BuildContext context) {
    print('asdas');
    return Scaffold(
      appBar: AppBar(title: Text('Example Two', style: TextStyle(fontSize: 20)), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.isSwitch != current.isSwitch,
            builder: (context, states) {
              return Center(
                child: Switch(
                  value: states.isSwitch,
                  onChanged: (newVal) {
                    context.read<SwitchBloc>().add(EnableOrDisableNotification());
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20),
          BlocBuilder<SwitchBloc, SwitchState>(
            buildWhen: (previous, current) => previous.slider != current.slider,

            builder: (context, states) {
              return Container(height: 200, width: 400, color: Colors.red.withOpacity(states.slider));
            },
          ),

          SizedBox(height: 20),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, states) {
              return Center(
                child: Slider(
                  value: states.slider,
                  onChanged: (newVal) {
                    context.read<SwitchBloc>().add(SliderEvent(newVal));
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
