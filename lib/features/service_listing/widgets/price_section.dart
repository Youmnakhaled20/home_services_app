// lib/features/service_listing/widgets/price_section.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class PriceSection extends StatelessWidget {
  final String price;
  const PriceSection({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Starting at",
          style: AppTextStyles.labelSmall(context).copyWith(
            color: isDark ? const Color(0xFF9CA3AF) : Colors.white70,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          price,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.titleSmall(context).copyWith(
            color: isDark ? AppColors.darkNeon : Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
        ),
      ],
    );
  }
}