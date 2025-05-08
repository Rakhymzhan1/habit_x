import 'package:flutter/material.dart';
import 'package:habit_x/themes/text_temes.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({
    super.key,
    required this.message,
    required this.description,
  });
  final String message;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message,
              style: AppTextThemes.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(description, style: AppTextThemes.bodySmall),
          ],
        ),
      ),
    );
  }
}
