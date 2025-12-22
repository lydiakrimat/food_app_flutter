import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';
import 'package:food_app/core/widgets/text_button_widget.dart';

class FooterWidget extends StatelessWidget {
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  const FooterWidget({
    super.key,
    required this.onPressed, required this.text, required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(
          text,//"Don't have an account?",
          style: TextStyle(color: AppColors.dark),
        ),
        TextButtonWidget(
          textColor: AppColors.secondary,
          isUnderlined: false,
          text:buttonText,  //"Create Account",
          function: onPressed,
        ),
      ],
    );
  }
}

