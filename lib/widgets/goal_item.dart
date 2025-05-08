import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:habit_x/entities/goal_entity.dart';
import 'package:habit_x/themes/text_temes.dart';

class GoalItem extends StatelessWidget {
  const GoalItem({super.key, required this.goal, this.onDelete, this.onEdit, this.onTap});

  final GoalEntity goal;
  final VoidCallback? onDelete;
  final VoidCallback? onEdit;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            if (onDelete != null) {
              onEdit!();
            }
          },
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.blue,
          icon: Icons.edit,
          label: 'Edit',
        ),
      ],
      
      ),
      endActionPane: ActionPane(motion: ScrollMotion(), children: [
        SlidableAction(
          onPressed: (context) {
            if (onEdit != null) {
              onDelete!();
            }
          },
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.red,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Color(0xffD0D0D0),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      goal.name,
                      style: AppTextThemes.bodyMedium.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.more_vert, color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _itemRow(keyA: 'Start: ', value: '${goal.startDate}'),
                const SizedBox(height: 5),
                _itemRow(keyA: 'Deadline: ', value: '${goal.endDate}'),
                const SizedBox(height: 5),
                _itemRow(keyA: 'Steps: : ', value: '0/0'),
                const SizedBox(height: 5),
                _itemRow(keyA: 'Days left: ', value: '1/0'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _itemRow extends StatelessWidget {
  const _itemRow({required this.keyA, required this.value});

  final String keyA;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          keyA,
          style: AppTextThemes.bodyMedium.copyWith(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          value,
          style: AppTextThemes.bodyMedium.copyWith(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
