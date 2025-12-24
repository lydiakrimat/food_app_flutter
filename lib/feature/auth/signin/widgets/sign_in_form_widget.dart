import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/const/app_colors.dart';
import 'package:food_app/core/widgets/password_form_widget.dart';
import 'package:food_app/core/widgets/text_form_widget.dart';
import 'package:food_app/feature/auth/signin/manager/sign_in_cubit.dart';

class SignInFormWidget extends StatelessWidget {
  const SignInFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SignInCubit cubit = context.read<SignInCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('email', style: TextStyle(color: AppColors.dark, fontSize: 16)),
          SizedBox(height: 8),
          TextFormWidget(
            controller: cubit.emailController,
            text: 'exemple@gmail.com',
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          SizedBox(height: 16),
          Text(
            'password',
            style: TextStyle(color: AppColors.dark, fontSize: 16),
          ),
          SizedBox(height: 8),
          PasswordFormWidget(
            text: 'Enter your password',
            controller: cubit.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              if (value.length < 8) {
                return 'Password must be at least 8 characters';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
