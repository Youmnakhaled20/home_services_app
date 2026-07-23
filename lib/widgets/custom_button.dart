// lib/widgets/custom_button.dart
import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isOutlined) {
      return OutlinedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        label: Text(text),
        style: OutlinedButton.styleFrom(
          foregroundColor: isDark ? AppColors.darkText : AppColors.white,
          side: BorderSide(
            color: isDark ? AppColors.darkNeon : AppColors.white,
            width: isDark ? 1.5 : 1.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: AppTextStyles.buttonMedium(context),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: isDark ? AppColors.darkNeon : AppColors.white,
        foregroundColor: isDark ? Colors.black : AppColors.lightPrimary,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 13,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        textStyle: AppTextStyles.buttonMedium(context),
      ),
    );
  }
}