// lib/features/home/presentation/widgets/category_card.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../models/category_item_model.dart';

class CategoryCard extends StatelessWidget {
  final CategoryItemModel category;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap ??
              () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${category.title} selected'),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
      borderRadius: BorderRadius.circular(16),
      splashColor: AppColors.lightPrimary.withOpacity(0.6),
      highlightColor: AppColors.lightPrimary.withOpacity(0.05),
      child: Container(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkCard : AppColors.lightCard,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isDark
                ? AppColors.darkBorder.withOpacity(0.6)
                : AppColors.lightBorder.withOpacity(0.12),
            width: isDark ? 1.5 : 1.0,
          ),
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.4)
                  : Colors.black.withOpacity(0.04),
              blurRadius: 10,
              spreadRadius: 2,
              offset: const Offset(0, 4),
            ),
            if (isDark)
              BoxShadow(
                color: AppColors.darkNeon.withOpacity(0.05),
                blurRadius: 20,
                spreadRadius: 5,
                offset: const Offset(0, 0),
              ),
          ],
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 4,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 56,
              height: 52,
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkNeon.withOpacity(0.12)
                    : AppColors.lightSecondary,
                borderRadius: BorderRadius.circular(14),
                border: isDark
                    ? Border.all(
                  color: AppColors.darkNeon.withOpacity(0.25),
                  width: 1.2,
                )
                    : null,
                boxShadow: [
                  if (isDark)
                    BoxShadow(
                      color: AppColors.darkNeon.withOpacity(0.1),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                ],
              ),
              child: Center(
                child: SvgPicture.asset(
                  category.icon,
                  width: 30,
                  height: 30,
                  colorFilter: ColorFilter.mode(
                    isDark ? AppColors.darkNeon : AppColors.lightPrimary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child:Text(
                category.title,
                textAlign: TextAlign.center,
                style: AppTextStyles.labelSmall(context).copyWith(
                  color: isDark ? AppColors.darkText : AppColors.lightText,
                  height: 1.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}