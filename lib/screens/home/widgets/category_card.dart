import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theme/app_colors.dart';
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
      borderRadius: BorderRadius.circular(14),
      splashColor: AppColors.primary.withOpacity(0.6),
      highlightColor: AppColors.primary.withOpacity(0.05),
      child: Container(
        decoration: BoxDecoration(
          color: isDark
              ? Colors.white.withOpacity(0.15)
              : AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: isDark
              ? Border.all(
            color: Colors.white.withOpacity(0.2),
            width: 1.5,
          )
              : null,
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.black.withOpacity(0.4)  // ✅ 40% بدل 60%
                  : Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 2),
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
              width: 50,
              height: 45,
              decoration: BoxDecoration(
                color: isDark
                    ? Colors.white.withOpacity(0.9)  // ✅ 90% أبيض
                    : AppColors.secondary,
                borderRadius: BorderRadius.circular(12),
                border: isDark
                    ? Border.all(
                  color: Colors.white.withOpacity(0.3),  // ✅ 30%
                  width: 1,
                )
                    : null,
              ),
              child: Center(
                child: SvgPicture.asset(
                  category.icon,
                  width: 30,
                  height: 35,
                  colorFilter: ColorFilter.mode(
                    isDark ? AppColors.primary : AppColors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Flexible(
              child: Text(
                category.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: isDark ? Colors.white : AppColors.black,
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