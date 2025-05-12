import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/goals_bloc/goals_cubit.dart';
import 'package:habit_x/blocs/goals_bloc/goals_state.dart';
import 'package:habit_x/entities/goal_entity.dart';
import 'package:habit_x/screens/goal_item_page.dart';
import 'package:habit_x/themes/text_temes.dart';
import 'package:habit_x/widgets/custom_filled_button.dart';
import 'package:habit_x/widgets/custom_float_button.dart';
import 'package:habit_x/widgets/custom_text_form_field.dart';
import 'package:habit_x/widgets/empty_message.dart';
import 'package:habit_x/widgets/goal_item.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  final goalController = TextEditingController();
  final startDateController = TextEditingController(text: '12/05/2025');
  final endDateController = TextEditingController(text: '13/05/2025');
  final goalsCubit = GoalsCubit();

  Future<void> _onAddButtonPressed(BuildContext context) async {
    if (context.mounted) {
      Navigator.pop(context);
    }
    await goalsCubit.addGoal(
      title: goalController.text,
      startDate: startDateController.text,
      endDate: endDateController.text,
    );

    goalController.clear();
    startDateController.clear();
    endDateController.clear();
  }

  void onEdit(String id) {}

  Future<void> onDelete(String id) async {
    await goalsCubit.deleteGoal(goalId: id);
  }

  void onGoalItemTap(GoalEntity goal) {
    Navigator.push(context, GoalItemPage.route(goal: goal));
  }

  var startMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  var endMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: goalsCubit,
      child: Scaffold(
        body: BlocBuilder<GoalsCubit, GoalsState>(
          bloc: goalsCubit,

          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.goals.isEmpty) {
              return const EmptyMessage(
                message: 'You don’t have any goals yet.',
                description:
                    'Goal Manager is an effective tool for scheduling and managing your daily goals. Improve and increase your productivity by tracking the status of your daily goals.',
              );
            } else if (state.status.isFailure) {
              return const Center(child: Text('Error loading goals'));
            } else if (state.goals.isNotEmpty) {
              return ListView.builder(
                itemCount: state.goals.length + 1,
                itemBuilder: (context, index) {
                  if (index == state.goals.length || state.goals.isEmpty) {
                    {
                      return SizedBox(
                        height: 140,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Center(
                              child: Text(
                                'Swipe left to delete Goal, right to edit!',
                                style: AppTextThemes.bodyMedium.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                  final goal = state.goals[index];
                  return GoalItem(
                    goal: goal,
                    onDelete: () async => onDelete(goal.id),
                    onEdit: () async => onEdit(goal.id),
                    onTap: () => onGoalItemTap(goal),
                  );
                },
              );
            }
            return const Center(child: Text('No goals available'));
          },
        ),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: () => showCustomBottomSheet(),
          icon: const Icon(Icons.add, size: 35),
        ),
      ),
    );
  }

  void showCustomBottomSheet() {
    showBottomSheet(
      showDragHandle: true,
      enableDrag: true,
      backgroundColor: Color(0xff232323),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                hintText: 'Enter your goal...',
                controller: goalController,
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                prefixText: 'Start ',
                controller: startDateController,
                inputFormatter:
                    startMaskFormatter, // Use separate formatter for start date
              ),
              const SizedBox(height: 10),
              CustomTextFormField(
                prefixText: 'Deadline ',
                controller: endDateController,
                inputFormatter:
                    endMaskFormatter, // Use separate formatter for end date
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 45,
                width: double.infinity,
                child: CustomFilledButton(
                  text: 'Add',
                  onPressed: () async {
                    return _onAddButtonPressed(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
