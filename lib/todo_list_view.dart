import 'package:bloc_playlist/blocs/all_bloc/todo_bloc.dart';
import 'package:bloc_playlist/blocs/events/todo_event.dart';
import 'package:bloc_playlist/states/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: 'Task : ' + i.toString()));
          }
        },
        child: Center(child: Icon(Icons.add)),
      ),
      appBar: AppBar(title: Text('Todo List'), centerTitle: true),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state.todoList.isEmpty) {
            return Center(child: Text('No Item Found'));
          } else if (state.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: state.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(RemoveTodoEvent(task: state.todoList[index]));
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
