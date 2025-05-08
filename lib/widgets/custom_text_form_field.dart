import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:habit_x/themes/text_temes.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.prefixText,
    this.inputFormatter,
    this.focusNode,
  });
  final String? hintText;
  final TextEditingController? controller;
  final String? prefixText;
  final TextInputFormatter? inputFormatter;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: AppTextThemes.bodyMedium.copyWith(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      cursorColor: Theme.of(context).colorScheme.primary,
      maxLines: 1,
      minLines: 1,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.start,
      // autofocus: true,
      focusNode: focusNode,
      inputFormatters: inputFormatter != null ? [inputFormatter!] : null,
      decoration: InputDecoration(
        
        // prefixText: prefixText,
        // prefixStyle: AppTextThemes.bodyMedium.copyWith(
        //   color: Colors.black,
        //   fontSize: 16,
        //   fontWeight: FontWeight.w600,
        // ),
        prefix:
            prefixText != null
                ? Text(
                  prefixText!,
                  style: AppTextThemes.bodyMedium.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                )
                : null,
        hintText: hintText,
        hintStyle: AppTextThemes.bodyMedium.copyWith(
          color: Theme.of(context).colorScheme.surface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }
}
