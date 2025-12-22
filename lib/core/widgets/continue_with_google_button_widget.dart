import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';

class ContinueWithGoogleButtonWidget extends StatelessWidget {
  const ContinueWithGoogleButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white, // Fond blanc pour le bouton Google
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[300]!,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset:  Offset(0, 2),
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          // TODO Handle Google sign-in
          print('Google Sign-In pressed');
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 24, 
              height: 24, 
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.asset(
                'lib/core/assets/images/google.png',
                fit: BoxFit.contain, // S'adapte à la taille du container
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Continue with Google',
              style: TextStyle(
                color: AppColors.dark,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}