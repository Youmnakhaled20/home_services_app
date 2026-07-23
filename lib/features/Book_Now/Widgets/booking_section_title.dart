// lib/features/booking/presentation/widgets/booking_section_title.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';

class BookingSectionTitle extends StatelessWidget {
  final String title;
  final bool dark;

  const BookingSectionTitle(this.title, this.dark, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 4,
          height: 18,
          decoration: BoxDecoration(
            color: dark ? AppColors.darkNeon : AppColors.lightPrimary,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: AppTextStyles.titleSmall(context).copyWith(
            color: dark ? AppColors.darkText : AppColors.lightPrimary,
          ),
        ),
      ],
    );
  }
}