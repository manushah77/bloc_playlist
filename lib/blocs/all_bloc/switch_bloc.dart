import 'package:bloc/bloc.dart';
import 'package:bloc_playlist/blocs/events/switch_event.dart';
import 'package:bloc_playlist/states/swith_state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchState()) {
    on<EnableOrDisableNotification>(_enableNotification);
    on<SliderEvent>(_slider);
  }

  void _enableNotification(EnableOrDisableNotification events, Emitter<SwitchState> emit) {
    emit(state.copyWith(isSwitch: !state.isSwitch));
  }

  void _slider(SliderEvent events, Emitter<SwitchState> emit) {
    emit(state.copyWith(slider: events.slider));
  }
}
