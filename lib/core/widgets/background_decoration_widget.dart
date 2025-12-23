import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';

class BackgroundDecorationWidget extends StatelessWidget {
  final Widget child;
  final String? title;
  final String? subtitle;
  const BackgroundDecorationWidget({super.key, required this.child, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: AppColors.dark,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            top: -90,
            right: -90,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                color: AppColors.secondary.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title ?? '',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  subtitle ?? '',
                  style: TextStyle(
                    color: AppColors.primary.withValues(alpha: 0.6),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 200,
            bottom: 0,
            right: 0,
            left: 0,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                //height: MediaQuery.of(context).size.height - 200,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  // borderRadius: BorderRadius.only(
                  //   topLeft: Radius.circular(30),
                  //   topRight: Radius.circular(30),
                  // ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: child
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}