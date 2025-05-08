import 'package:flutter/material.dart';
import 'package:habit_x/themes/text_temes.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({
    super.key, required this.text,required this.onPressed, this.color = Colors.white,
  });

  final String text;
  final VoidCallback onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
      ),
      onPressed:onPressed,
      child: Text(
        text,
        style: AppTextThemes.bodyMedium.copyWith(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
 