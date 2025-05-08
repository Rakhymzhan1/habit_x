import 'package:flutter/material.dart';
import 'package:habit_x/entities/goal_entity.dart';
import 'package:habit_x/themes/text_temes.dart';
import 'package:habit_x/widgets/custom_float_button.dart';

class GoalItemPage extends StatefulWidget {
  final GoalEntity? goal;
  const GoalItemPage({super.key, required this.goal});
  static MaterialPageRoute route({required GoalEntity goal}) =>
      MaterialPageRoute(builder: (context) => GoalItemPage(goal: goal));

  @override
  State<GoalItemPage> createState() => _GoalItemPageState();
}

class _GoalItemPageState extends State<GoalItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomFloatingActionButton(
        icon: const Icon(Icons.add, size: 35),
        onPressed: () {
          // Add your action here
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              widget.goal?.name ?? 'Goal Item',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Container(
                    height: 90,
                    width: 90,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        width: 10,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '0%',
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _rowWidget(context, keyA: 'Pending: ', value: '1'),
                      _rowWidget(context, keyA: 'Completed: ', value: '0'),
                      _rowWidget(context, keyA: 'Total steps: ', value: '1'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Pending',
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text('May 11, 2025', style: AppTextThemes.bodySmall.copyWith(
                fontSize: 18,
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w400,
              )),
            )
          ],
        ),
      ),
    );
  }

  SizedBox _rowWidget(
    BuildContext context, {
    required String keyA,
    required String value,
  }) {
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 30),
              Container(
                height: 15,
                width: 15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
              SizedBox(width: 5),
              Text(
                keyA,
                style: AppTextThemes.bodySmall.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ),
            ],
          ),
          Text(
            value,
            style: AppTextThemes.bodySmall.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
