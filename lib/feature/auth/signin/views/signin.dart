import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/const/app_colors.dart';
import 'package:food_app/core/const/cash_keys.dart';
import 'package:food_app/core/helper/cash.dart';
import 'package:food_app/core/widgets/background_decoration_widget.dart';
import 'package:food_app/core/widgets/continue_with_google_button_widget.dart';
import 'package:food_app/core/widgets/footer_links_widget.dart';
import 'package:food_app/core/widgets/separation_line_widget.dart';
import 'package:food_app/feature/auth/signin/manager/sign_in_cubit.dart';
import 'package:food_app/feature/auth/signin/manager/sign_in_state.dart';
import 'package:food_app/feature/auth/signin/widgets/sign_in_form_widget.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_cubit.dart';
import 'package:food_app/feature/auth/signup/views/sign_up.dart';
import 'package:food_app/feature/home/views/home.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  void navigateToSignUp(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BlocProvider(create: (context) => SignUpCubit(), child: SignUp()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild signin page");
    return BackgroundDecorationWidget(
      title: "Log In",
      subtitle: "Welcome back! Please enter your details.",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignInFormWidget(),
          SizedBox(height: 24),
          BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              if (state.status == SignInStatus.success) {
                CashHelper.putCash(key: CashKeys.isLogin, value: true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Home(),
                    // builder: (context) => BlocProvider(
                    //   create: (context) => HomeCubit(),
                    //   child: Home(),
                    // ),
                  ),
                );
              } else if (state.status == SignInStatus.failure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (context
                      .read<SignInCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignInCubit>().signIn();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 16),
          FooterWidget(
            text: "Don't have an account?",
            buttonText: "Create Account",
            onPressed: () => navigateToSignUp(context),
          ),
          SizedBox(height: 20),
          SeparationLineWidget(text: "OR"),
          SizedBox(height: 20),
          ContinueWithGoogleButtonWidget(),
        ],
      ),
    );
  }
}
