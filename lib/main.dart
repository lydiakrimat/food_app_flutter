import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/core/const/cash_keys.dart';
import 'package:food_app/core/helper/cash.dart';
import 'package:food_app/core/helper/observer.dart';
import 'package:food_app/core/theme/app_theme_google_fonts.dart';
import 'package:food_app/feature/auth/signin/manager/sign_in_cubit.dart';
import 'package:food_app/feature/auth/signin/views/signin.dart';
import 'package:food_app/feature/auth/wrapper/auth_wrapper.dart';
import 'package:food_app/feature/home/views/user_home.dart';
import 'package:food_app/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  Bloc.observer = MyBlocObserver();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: AppThemeGoogle.lightTheme, // Thème avec Google Fonts
      darkTheme: AppThemeGoogle.darkTheme,
      themeMode: ThemeMode.light,
      // home: SignIn(),
      home: AuthWrapper()
    );
  }
}
