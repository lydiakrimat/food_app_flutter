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
import 'package:food_app/feature/auth/signin/views/signin.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_cubit.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';
import 'package:food_app/feature/auth/signup/widgets/sign_up_form_widget.dart';
import 'package:food_app/feature/home/views/admin_home.dart';
import 'package:food_app/feature/home/views/user_home.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  void navigateToSignIn(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            BlocProvider(create: (context) => SignInCubit(), child: SignIn()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("rebuild signup page");
    return BackgroundDecorationWidget(
      title: "Sign Up",
      subtitle: "Please sign up to get started",
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SignUpFormWidget(),
          SizedBox(height: 24),
          BlocConsumer<SignUpCubit, SignUpState>(
            listener: (context, state) {
              if (state.status == SignUpStatus.success) {
                CashHelper.putCash(key: CashKeys.isLogin, value: true);
                final cubit = context.read<SignUpCubit>();

                if (cubit.currentUser != null) {
                  CashHelper.saveUser(cubit.currentUser!);

                  if (cubit.currentUser!.isAdmin) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => AdminHome()),
                    );
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => UserHome()),
                    );
                  }
                }
              } else if (state.status == SignUpStatus.failure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
            },
            builder: (context, state) {
              if (state.status == SignUpStatus.loading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.secondary),
                );
              }
              return ElevatedButton(
                onPressed: () {
                  if (context
                      .read<SignUpCubit>()
                      .formKey
                      .currentState!
                      .validate()) {
                    context.read<SignUpCubit>().signUp();
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
                    'Sign Up',
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
          FooterWidget(
            text: "Already have an account?",
            buttonText: "Sign In",
            onPressed: () => navigateToSignIn(context),
          ),
          SeparationLineWidget(text: "OR"),
          ContinueWithGoogleButtonWidget(),
        ],
      ),
    );
  }
}
