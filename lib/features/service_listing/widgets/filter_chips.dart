// lib/features/service_listing/widgets/filter_chips.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';

class FilterChips extends StatelessWidget {
  final int currentIndex;
  final Function(int) onChanged;

  const FilterChips({
    super.key,
    required this.currentIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final filters = ["All Services", "Deep Clean", "Eco-Friendly", "Express", "Standard"];

    return SizedBox(
      height: 60,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final selected = currentIndex == index;

          return GestureDetector(
            onTap: () => onChanged(index),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: selected ? const Color(0xFF00B074) : Colors.grey.withOpacity(0.3),
                  width: selected ? 1.2 : 1,
                ),
              ),
              child: Text(
                filters[index],
                style: AppTextStyles.labelMedium(context).copyWith(
                  fontWeight: FontWeight.w600,
                  color: selected ? const Color(0xFF00B074) : (isDark ? Colors.grey[400] : Colors.grey[700]),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}