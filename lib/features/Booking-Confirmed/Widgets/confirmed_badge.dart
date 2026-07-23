// lib/features/booking/presentation/widgets/confirmed_badge.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class ConfirmedBadge extends StatelessWidget {
  const ConfirmedBadge({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkNeon.withOpacity(0.12) : AppColors.lightPrimary.withOpacity(0.06),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark ? AppColors.darkNeon.withOpacity(0.2) : AppColors.lightPrimary.withOpacity(0.1),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle_outline_rounded,
            color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            "Your service provider is on the way",
            style: AppTextStyles.bodyMedium(context).copyWith(
              fontWeight: FontWeight.w500,
              color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
            ),
          ),
        ],
      ),
    );
  }
}