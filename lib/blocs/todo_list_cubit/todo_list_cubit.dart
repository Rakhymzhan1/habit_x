import 'package:bloc/bloc.dart';
import 'package:habit_x/blocs/todo_list_cubit/todo_list_state.dart';
import 'package:habit_x/entities/todo_entity.dart';


// Define the Cubit
class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(const TodoListState());

  void addTodo(TodoEntity todo) {
    final updatedTodos = List<TodoEntity>.from(state.todos)..add(todo);
    emit(state.copyWith(todos: updatedTodos));
  }

  void removeTodoAt(String id) {
    final index = state.todos.indexWhere((todo) => todo.id == id);
    if (index == -1) return; // Todo not found
    final updatedTodos = List<TodoEntity>.from(state.todos)..removeWhere((val)=> val.id == id);
    emit(state.copyWith(todos: updatedTodos));
  }

  void clearTodos() {
    emit(state.copyWith(todos: []));
  }
}