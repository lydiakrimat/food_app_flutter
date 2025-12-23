import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/helper/cash.dart';
import 'package:food_app/feature/auth/signin/manager/sign_in_cubit.dart';
import 'package:food_app/feature/auth/signin/views/signin.dart';
import 'package:food_app/feature/home/views/admin_home.dart';
import 'package:food_app/feature/home/views/user_home.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    if (!CashHelper.isLoggedIn()) {
      return BlocProvider(create: (context) => SignInCubit(), child: SignIn());
    }

    final user = CashHelper.getUser();
    
    if (user != null) {
      if (user.isAdmin) {
        return  AdminHome();
      } else {
        return  UserHome();
      }
    }
    
    return BlocProvider(create: (context) => SignInCubit(), child: SignIn());
  }
}