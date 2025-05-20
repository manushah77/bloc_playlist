import 'package:equatable/equatable.dart';

abstract class SwitchEvent extends Equatable {
  SwitchEvent();

  @override
  List<Object> get props => [];
}

class EnableOrDisableNotification extends SwitchEvent {}

class SliderEvent extends SwitchEvent {
  double slider;

  SliderEvent(this.slider);
  @override
  List<Object> get props => [slider];
}
