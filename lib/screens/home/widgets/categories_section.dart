import 'package:flutter/material.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../data/categories_items_data.dart';
import '../../../data/categories_data.dart';
import 'category_card.dart';
import '../../service_listing/service_listing_screen.dart';
class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
            "Our Services",
            style: AppTextStyles.sectionTitle.copyWith(
              color: isDark ? Colors.white : null,
            ),
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 0.85,
          ),
          itemCount: mainCategories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: mainCategories[index],
              onTap: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ServiceListingScreen(
                      category: categories[index],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}