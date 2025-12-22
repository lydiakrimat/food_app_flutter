import 'package:flutter/material.dart';
import 'package:food_app/core/const/app_colors.dart';

class SeparationLineWidget extends StatelessWidget {
  final String text;
  const SeparationLineWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: AppColors.secondary.withValues(alpha: 0.5),
              thickness: 1.5, 
              endIndent: 10, // espace après la ligne
            ),
          ),
          Text(
            text,
            style: TextStyle(
              color: AppColors.dark.withValues(alpha: 0.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Divider(
              color: AppColors.secondary.withValues(alpha: 0.5),
              thickness: 1.5,
              indent: 10, // espace avant la ligne
            ),
          ),
        ],
      ),
    );
  }
}
