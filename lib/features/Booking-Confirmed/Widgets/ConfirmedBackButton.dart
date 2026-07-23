// lib/features/booking/presentation/widgets/confirmed_back_button.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class ConfirmedBackButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const ConfirmedBackButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed ?? () => Navigator.pop(context),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          side: BorderSide(
            color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.arrow_back_rounded,
              color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              "Back to Home",
              style: AppTextStyles.buttonMedium(context).copyWith(
                color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}