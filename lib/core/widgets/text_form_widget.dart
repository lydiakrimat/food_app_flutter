import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';

class TextFormWidget extends StatelessWidget {
  final String text;
  final TextInputType keyboardType;
  final bool obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;

  const TextFormWidget({
    super.key,
    required this.text,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.controller,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    print("rebuild password");
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true, //filled==true to apply fillColor
        fillColor: AppColors.filling,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: text,
        hintStyle: TextStyle(color: AppColors.dark.withValues(alpha: 0.5)),
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(color: AppColors.dark),
    );
  }
}
