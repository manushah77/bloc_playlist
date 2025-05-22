import 'package:bloc/bloc.dart';
import 'package:bloc_playlist/blocs/events/todo_event.dart';
import 'package:bloc_playlist/states/todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {

  final List<String> list = [];

  TodoBloc() : super(TodoState()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoState> emit) {

    list.add(event.task);

    emit(state.copyWith(todoList: List.from(list)));
  }

  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoState> emit) {

    list.remove(event.task);

    emit(state.copyWith(todoList: List.from(list)));
  }


}
