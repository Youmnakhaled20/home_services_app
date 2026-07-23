// lib/features/booking/presentation/widgets/confirmed_success_icon.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ConfirmedSuccessIcon extends StatelessWidget {
  const ConfirmedSuccessIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkNeon.withOpacity(0.12) : AppColors.lightPrimary.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: isDark ? AppColors.darkNeon.withOpacity(0.3) : AppColors.lightPrimary.withOpacity(0.2),
          width: 3,
        ),
        boxShadow: isDark ? [
          BoxShadow(color: AppColors.darkNeon.withOpacity(0.25), blurRadius: 40, spreadRadius: 10),
          BoxShadow(color: AppColors.darkNeon.withOpacity(0.1), blurRadius: 80, spreadRadius: 20),
        ] : [
          BoxShadow(color: AppColors.lightPrimary.withOpacity(0.1), blurRadius: 20, spreadRadius: 5),
        ],
      ),
      child: Icon(
        Icons.check_circle_rounded,
        color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
        size: 60,
      ),
    );
  }
}