// lib/features/service_listing/widgets/empty_services.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class EmptyServices extends StatelessWidget {
  const EmptyServices({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.search_off_rounded, size: 45, color: Colors.white.withOpacity(0.5)),
            ),
            const SizedBox(height: 20),
            Text(
              "No Services Found",
              style: AppTextStyles.headlineSmall(context).copyWith(
                color: isDark ? Colors.white : AppColors.lightText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "We couldn't find any services matching your search.",
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: isDark ? Colors.white.withOpacity(0.6) : AppColors.lightTextSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}