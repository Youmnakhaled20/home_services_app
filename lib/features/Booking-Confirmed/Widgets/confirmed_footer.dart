// lib/features/booking/presentation/widgets/confirmed_footer.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class ConfirmedFooter extends StatelessWidget {
  const ConfirmedFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.shield_rounded,
          color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
          size: 14,
        ),
        const SizedBox(width: 6),
        Text(
          "A LUXEHOME CONCIERGE EXPERIENCE",
          style: AppTextStyles.labelSmall(context).copyWith(
            color: isDark ? AppColors.darkNeon : AppColors.lightTextSecondary,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }
}