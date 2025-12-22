import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/const/app_colors.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_cubit.dart';
import 'package:food_app/feature/auth/signup/manager/sign_up_state.dart';

class RestaurantManagerCheckboxWidget extends StatelessWidget {
  const RestaurantManagerCheckboxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        final isChecked = state.userRole == UserRole.ADMIN;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            children: [
              // Checkbox
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: isChecked,
                  onChanged: (bool? value) {
                    cubit.toggleRestaurantManager(value ?? false);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(
                    color: AppColors.dark..withValues(alpha: 0.5),
                    width: 1.5,
                  ),
                  activeColor: AppColors.secondary,
                  checkColor: AppColors.primary,
                ),
              ),

              SizedBox(width: 12),

              // Texte cliquable
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    cubit.toggleRestaurantManager(!isChecked);
                  },
                  child: Text(
                    'Check if you are a restaurant manager',
                    style: TextStyle(
                      color: AppColors.dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}