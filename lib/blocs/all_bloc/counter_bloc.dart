import 'package:bloc/bloc.dart';
import 'package:bloc_playlist/blocs/events/counter_event.dart';
import 'package:bloc_playlist/states/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementCounter> (_increment);
    on<DecrementCounter> (_deccrement);

  }

  void _increment (IncrementCounter event, Emitter <CounterState> emit) {
    emit(state.copyWith(counter: state.counter+1));

  }


  void _deccrement (DecrementCounter event, Emitter <CounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));

  }

}
