import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/const/app_colors.dart';
import 'package:food_app/core/widgets/text_form_widget.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_cubit.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';
import 'package:food_app/feature/auth/signup/widgets/restaurant_manager_checkbox_widget.dart';

class SignUpFormWidget extends StatelessWidget {

  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //spacing: 10,
            children: [
              Text(
                'first name',
                style: TextStyle(color: AppColors.dark, fontSize: 16),
              ),
              TextFormWidget(
                controller: cubit.firstNameController,
                text: 'Enter your first name',
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your first name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'last name',
                style: TextStyle(color: AppColors.dark, fontSize: 16),
              ),
              TextFormWidget(
                controller: cubit.lastNameController,
                text: 'Enter your last name',
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your last name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'email',
                style: TextStyle(color: AppColors.dark, fontSize: 16),
              ),
              TextFormWidget(
                controller: cubit.emailController,
                text: 'exemple@gmail.com',
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'password',
                style: TextStyle(color: AppColors.dark, fontSize: 16),
              ),
              TextFormWidget(
                controller: cubit.passwordController,
                text: 'Enter your password',
                isPassword: true,
                keyboardType: TextInputType.visiblePassword,
                validator: (value) => value == null || value.length < 8
                    ? "password must be at least 8 characters"
                    : null,
              ),
              SizedBox(height: 10),
              Text(
                'age',
                style: TextStyle(color: AppColors.dark, fontSize: 16),
              ),
              TextFormWidget(
                controller: cubit.ageController,
                text: 'Enter your age',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  final age = int.tryParse(value);
                  if (age == null || age < 18) {
                    return 'You must be at least 18 years old';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              Text(
                'phone number',
                style: TextStyle(color: AppColors.dark, fontSize: 16),
              ),
              TextFormWidget(
                controller: cubit.phoneNumberController,
                text: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (!RegExp(r'^[0-9]{10,}$').hasMatch(value.replaceAll(' ', ''))) {
                    return 'Please enter a valid phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10),
              RestaurantManagerCheckboxWidget(),
            ],
          ),
        );
      },
    );
  }
}
