import 'package:equatable/equatable.dart';
import 'package:habit_x/entities/goal_entity.dart';

class GoalsState extends Equatable {
  final GoalsStateStatus status;
  final List<GoalEntity> goals;
  final String? error;

  // Убираем дублирование и оставляем только один фабричный метод
  factory GoalsState.initial() => GoalsState(
    goals: [],
    error: null,
    status: GoalsStateStatus.initial,
  );

  const GoalsState({
    required this.status,
    required this.goals,
    required this.error,
  });
  GoalsState copyWith({
    List<GoalEntity>? goals,
    bool? isLoading,
    String? error,
    GoalsStateStatus? status,
  }) {
    return GoalsState(
      status: status?? this.status,
      goals: goals ?? this.goals,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [goals, error, status];
}

enum GoalsStateStatus { initial, loading, success, failure }

extension GoalsStateStatusX on GoalsStateStatus {
  bool get isInitial => this == GoalsStateStatus.initial;
  bool get isLoading => this == GoalsStateStatus.loading;
  bool get isSuccess => this == GoalsStateStatus.success;
  bool get isFailure => this == GoalsStateStatus.failure;
}
