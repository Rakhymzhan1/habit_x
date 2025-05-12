import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_x/blocs/todo_list_cubit/todo_list_cubit.dart';
import 'package:habit_x/blocs/todo_list_cubit/todo_list_state.dart';
import 'package:habit_x/entities/todo_entity.dart';
import 'package:habit_x/themes/text_temes.dart';
import 'package:habit_x/widgets/custom_filled_button.dart';
import 'package:habit_x/widgets/custom_float_button.dart';
import 'package:habit_x/widgets/custom_text_form_field.dart';
import 'package:habit_x/widgets/empty_message.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final todoBloc = TodoListCubit();

  var selectedBarIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => todoBloc,
        child: BlocBuilder<TodoListCubit, TodoListState>(
          bloc: todoBloc,
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
                  padding: EdgeInsets.only(top: 20),
                  itemCount: state.todos.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return SizedBox(
                        height: 40,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            SizedBox(width: 10),
                            tabWidget(index: 0, label: 'Personal'),
                            SizedBox(width: 10),
                            tabWidget(index: 1, label: 'Work'),
                            SizedBox(width: 10),
                            tabWidget(index: 2, label: 'Glosery list'),
                            SizedBox(width: 10),
                            tabWidget(index: 3, label: 'Other'),
                            SizedBox(width: 10),
                          ],
                        ),
                      );
                    }
                    final todo = state.todos[index - 1];
                    return ListTile(
                      leading: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      title: Text(todo.task, style: AppTextThemes.bodyMedium),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          todo.isPriority
                              ? Icon(
                                Icons.star_rate,
                                color: Theme.of(context).colorScheme.primary,
                              )
                              : SizedBox(),
                              SizedBox(width: 10,),
                          Text(todo.deadline, style: AppTextThemes.bodySmall),
                        ],
                      ),
                    );
                  },
                );
              }
            } else if (state.status.isError) {
              return Center(child: Text('Failed to load tasks.'));
            }
            return EmptyMessage(
              message: 'You don’t have any tasks yet.',
              description:
                  'Task Manager is an effective tool for scheduling and managing your daily tasks. Improve and increase your productivity by tracking the status of your daily tasks.',
            );
          },
        ),
      ),
      floatingActionButton: CustomFloatingActionButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showCustomBottomSheet();
        },
      ),
    );
  }

  Widget tabWidget({required String label, required int index}) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        selectedBarIndex = index;
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: index == selectedBarIndex ? Colors.white : Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(
          label,
          style: AppTextThemes.bodyMedium.copyWith(
            color:
                index == selectedBarIndex
                    ? Colors.black
                    : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  void showCustomBottomSheet() {
    showBottomSheet(
      enableDrag: true,
      backgroundColor: Color(0xff232323),
      context: context,
      builder: (context) {
        return BottomSheetContent(todoListCubit: todoBloc);
      },
    );
  }
}

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key, required this.todoListCubit});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
  final TodoListCubit todoListCubit;
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController deadlineController = TextEditingController(
    text: '12/05/2025',
  );
  bool isPriority = false;
  var endMaskFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFormField(
            hintText: 'Enter a task...',
            controller: taskController,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            prefixText: 'Deadline ',
            controller: deadlineController,
            inputFormatter:
                endMaskFormatter, // Use separate formatter for end date
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                  semanticLabel: 'Priority',
                  side: BorderSide(width: 2, color: Colors.black),
                  checkColor: Colors.black,
                  activeColor: Colors.white,
                  value: isPriority,
                  onChanged: (val) {
                    isPriority = val ?? false;
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: const BorderSide(color: Colors.black, width: 2),
                  ),
                ),
                const Text('Priority', style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: CustomFilledButton(
              text: 'Add',
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  widget.todoListCubit.addTodo(
                    task: taskController.text,
                    deadline: deadlineController.text,
                    isPriority: isPriority,
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a task.')),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
