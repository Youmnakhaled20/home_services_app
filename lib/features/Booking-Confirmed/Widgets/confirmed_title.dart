// lib/features/booking/presentation/widgets/confirmed_title.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class ConfirmedTitle extends StatelessWidget {
  const ConfirmedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      children: [
        Text(
          "Booking Confirmed!",
          style: AppTextStyles.headlineMedium(context).copyWith(
            color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
            shadows: isDark ? [
              Shadow(color: AppColors.darkNeon.withOpacity(0.3), blurRadius: 20),
            ] : null,
          ),
        ),
        const SizedBox(height: 6),

      ],
    );
  }
}