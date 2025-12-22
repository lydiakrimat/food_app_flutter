import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';

class TextFormWidget extends StatefulWidget {
  final String text;
  final TextInputType keyboardType;
  final bool isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  //final IconData prefixIcon;

  const TextFormWidget({
    super.key,
    required this.text,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.validator, 
    this.controller , 
  });

  @override
  State<TextFormWidget> createState() => _TextFormWidgetState();
}

class _TextFormWidgetState extends State<TextFormWidget> {
  bool isObscureText = false;

  @override
  void initState() {
    isObscureText = widget.isPassword;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild password");
    return TextFormField(

      controller: widget.controller,
      decoration: InputDecoration(
        filled: true, //filled==true to apply fillColor
              fillColor: AppColors.filling,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: widget.text,
              hintStyle: TextStyle(
                color: AppColors.dark.withValues(alpha: 0.5),
              ),
        suffixIcon: widget.isPassword
            ? IconButton(
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
              )
            : null,
      ),
      keyboardType: widget.keyboardType,
      obscureText: isObscureText,
      validator: widget.validator,
style: TextStyle(color: AppColors.dark),    );
  }
}
