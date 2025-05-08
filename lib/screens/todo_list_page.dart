import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/todo_list_cubit/todo_list_cubit.dart';
import 'package:habit_x/blocs/todo_list_cubit/todo_list_state.dart';
import 'package:habit_x/widgets/custom_float_button.dart';
import 'package:habit_x/widgets/empty_message.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todoBloc = TodoListCubit();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
      create: (context) => todoBloc,
      child: BlocBuilder<TodoListCubit, TodoListState>(
        builder: (context, state) {
        if (state.status.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.status.isLoaded) {
          if (state.todos.isEmpty) {
          return EmptyMessage(
            message: 'You don’t have any tasks yet.',
            description:
              'Task Manager is an effective tool for scheduling and managing your daily tasks. Improve and increase your productivity by tracking the status of your daily tasks.',
          );
          } else {
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
            final todo = state.todos[index];
            return ListTile(
              title: Text(todo.task),
              subtitle: Text(todo.deadline.toString()),
            );
            },
          );
          }
        } else if (state.status.isError) {
          return Center(child: Text('Failed to load tasks.'));
        }
        return const SizedBox.shrink();
        },
      ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icon(Icons.add),
      ),
    );
  }
}
