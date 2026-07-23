// lib/features/service_listing/widgets/search_bar_widget.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class SearchBarWithImageHeader extends StatelessWidget {
  final Function(String) onSearch;
  final String categoryImage;
  final String categoryTitle;
  final int serviceCount;

  const SearchBarWithImageHeader({
    super.key,
    required this.onSearch,
    required this.categoryImage,
    required this.categoryTitle,
    required this.serviceCount,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 245,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(categoryImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.65),
                    Colors.black.withOpacity(0.25),
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 45, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryTitle,
                      style: AppTextStyles.headlineMedium(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        "$serviceCount Services Available",
                        style: AppTextStyles.labelMedium(context).copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkCard : Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 6),
                        ),
                      ],
                      border: Border.all(
                        color: isDark ? AppColors.darkBorder : Colors.grey.withOpacity(0.15),
                        width: isDark ? 1.5 : 1.0,
                      ),
                    ),
                    child: TextField(
                      onChanged: onSearch,
                      style: AppTextStyles.bodyMedium(context).copyWith(
                        color: isDark ? Colors.white : const Color(0xFF111111),
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search services...",
                        hintStyle: AppTextStyles.bodyMedium(context).copyWith(
                          color: isDark ? const Color(0xFFA0A0A0) : const Color(0xFF6B7280),
                        ),
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: isDark ? const Color(0xFFA0A0A0) : const Color(0xFF6B7280),
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isDark ? AppColors.darkNeon : const Color(0xFF235347),
                    borderRadius: BorderRadius.circular(26),
                    boxShadow: [
                      BoxShadow(
                        color: (isDark ? AppColors.darkNeon : const Color(0xFF235347)).withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.tune_rounded,
                    color: isDark ? Colors.black : Colors.white,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}