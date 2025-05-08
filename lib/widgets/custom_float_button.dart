import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key, this.onPressed, this.icon});
  final VoidCallback? onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            onPressed: onPressed,
            child: icon,
          ),
        );
  }
}
