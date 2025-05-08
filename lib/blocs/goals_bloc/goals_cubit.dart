import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/goals_bloc/goals_state.dart';
import 'package:habit_x/entities/goal_entity.dart';

class GoalsCubit extends Cubit<GoalsState>{
   GoalsCubit() : super(GoalsState.initial());

  addGoal({required String title, required String startDate, required String endDate}) async {
    emit(state.copyWith(
      status: GoalsStateStatus.loading,
    ));
    // Simulate a network call or some processing
    await Future.delayed(const Duration(seconds: 2));
    final goal = GoalEntity(
      id: generateRandomId(),
      name: title,
      startDate: startDate,
      endDate: endDate,
    );
    emit(state.copyWith(
      goals: [...state.goals, goal],
      status: GoalsStateStatus.success
    ));
  }

  deleteGoal({required String goalId}) async {
    emit(state.copyWith(
      status: GoalsStateStatus.loading,
    ));
    // Simulate a network call or some processing
    await Future.delayed(const Duration(seconds: 2));
    final goals = state.goals.where((goal) => goal.id != goalId).toList();
    emit(state.copyWith(
      goals: goals,
      status: GoalsStateStatus.success
    ));
  }
}


String generateRandomId() {
  const characters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
  final random = Random();
  return List.generate(10, (index) => characters[random.nextInt(characters.length)]).join();
}