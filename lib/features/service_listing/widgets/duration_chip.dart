// lib/features/service_listing/widgets/duration_chip.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class DurationChip extends StatelessWidget {
  final String duration;
  const DurationChip({super.key, required this.duration});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2D2D2D) : const Color(0xFFE8F8F2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        duration,
        style: AppTextStyles.labelSmall(context).copyWith(
          color: isDark ? AppColors.darkNeon : const Color(0xFF235347),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}