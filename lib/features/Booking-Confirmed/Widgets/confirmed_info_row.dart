// lib/features/booking/presentation/widgets/confirmed_info_row.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class ConfirmedInfoRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isLong;

  const ConfirmedInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.isLong = false,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.labelSmall(context).copyWith(
            color: isDark ? AppColors.darkTextSecondary : Colors.white70,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: (isLong ? AppTextStyles.bodyMedium(context) : AppTextStyles.titleSmall(context)).copyWith(
            color: isDark ? AppColors.darkNeon : Colors.white,
          ),
          maxLines: isLong ? 2 : 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}