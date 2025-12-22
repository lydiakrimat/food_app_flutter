import 'package:flutter/material.dart';
//import 'package:vtc_app/feature/auth/register/register_page.dart';

class TextButtonWidget extends StatelessWidget {
  final bool isUnderlined;
  final Color textColor;
  final Alignment textAlignment;
  final String text;
  final VoidCallback? function;

  const TextButtonWidget({
    super.key,
    this.isUnderlined = false,
    this.textAlignment = Alignment.center,
    required this.text,
    this.function, 
    required this.textColor, 

  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: textAlignment,
      child: TextButton(
        onPressed: function,
        child: 
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            decoration: isUnderlined
                ? TextDecoration.underline
                : TextDecoration.none,
            decorationColor: isUnderlined ? Colors.white : null,
            decorationThickness: isUnderlined ? 1 : null,
          ),
        ),
      ),
    );
  }
}
