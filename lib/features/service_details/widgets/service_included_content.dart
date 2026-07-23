import 'package:flutter/material.dart';
import '../../../../core/theme/dark_app_colors.dart';
import '../../../models/service_model.dart';

class ServiceIncludedContent extends StatelessWidget {
  final ServiceModel service;
  final bool isDarkMode;

  const ServiceIncludedContent({
    super.key,
    required this.service,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? DarkAppColors.text : Colors.white;
    final textColorSecondary = isDarkMode ? DarkAppColors.textSecondary : Colors.white60;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDarkMode ? DarkAppColors.primary.withOpacity(0.15) : Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.checklist_rounded,
                color: isDarkMode ? DarkAppColors.primary : Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'What\'s Included',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        ...service.included.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;
          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 600 + (index * 150)),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(0, 30 * (1 - value)),
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.04),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isDarkMode ? DarkAppColors.border.withOpacity(0.4) : Colors.white.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.check_circle_outline_rounded,
                      color: isDarkMode ? DarkAppColors.primary : Colors.white,
                      size: 18,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['title']!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: textColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item['description']!,
                            style: TextStyle(
                              fontSize: 12,
                              color: textColorSecondary,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ],
    );
  }
}