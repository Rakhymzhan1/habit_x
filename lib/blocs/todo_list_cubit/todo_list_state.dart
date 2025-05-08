import 'package:equatable/equatable.dart';
import 'package:habit_x/entities/todo_entity.dart';

enum TodoStatus { initial, loading, loaded, error }

extension TodoStatusX on TodoStatus {
  bool get isInitial => this == TodoStatus.initial;
  bool get isLoading => this == TodoStatus.loading;
  bool get isLoaded => this == TodoStatus.loaded;
  bool get isError => this == TodoStatus.error;
}

class TodoListState extends Equatable {
  final TodoStatus status;
  final List<TodoEntity> todos;
  final String? errorMessage;

  const TodoListState({
    this.status = TodoStatus.initial,
    this.todos = const [],
    this.errorMessage,
  });

  TodoListState copyWith({
    TodoStatus? status,
    List<TodoEntity>? todos,
    String? errorMessage,
  }) {
    return TodoListState(
      status: status ?? this.status,
      todos: todos ?? this.todos,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, todos, errorMessage];
}
