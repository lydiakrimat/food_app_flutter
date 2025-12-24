import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';
import 'package:food_app/core/widgets/text_form_widget.dart';

class PasswordFormWidget extends StatefulWidget {
  final String text;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const PasswordFormWidget({super.key, required this.text, this.controller, this.validator});

  @override
  State<PasswordFormWidget> createState() => _PasswordFormWidgetState();
}

class _PasswordFormWidgetState extends State<PasswordFormWidget> {
  bool isObscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormWidget(
      text: widget.text,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscureText,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            isObscureText = !isObscureText;
          });
        },
        icon: isObscureText
            ? Icon(
                Icons.visibility_outlined,
                color: AppColors.secondary,
              )
            : Icon(
                Icons.visibility_off,
                color: AppColors.secondary,
              ),
      ),

      );
  }
}