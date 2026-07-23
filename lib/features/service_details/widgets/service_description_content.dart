import 'package:flutter/material.dart';
import '../../../../core/theme/dark_app_colors.dart';
import '../../../models/service_model.dart';
class ServiceDescriptionContent extends StatelessWidget {
  final ServiceModel service;
  final bool isDarkMode;

  const ServiceDescriptionContent({
    super.key,
    required this.service,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isDarkMode ? DarkAppColors.text : Colors.white;
    final textColorSecondary = isDarkMode ? DarkAppColors.textSecondary : Colors.white70;

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
                Icons.description_outlined,
                color: isDarkMode ? DarkAppColors.primary : Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'About This Service',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          service.about,
          style: TextStyle(
            fontSize: 13,
            height: 1.6,
            color: textColorSecondary,
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDarkMode ? DarkAppColors.primary.withOpacity(0.15) : Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.lightbulb_outline_rounded,
                color: isDarkMode ? DarkAppColors.primary : Colors.white,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              'Key Features',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
          ],
        ),
        const SizedBox(height: 14),
        ...service.keyPoints.asMap().entries.map((entry) {
          final index = entry.key;
          final point = entry.value;
          return TweenAnimationBuilder<double>(
            duration: Duration(milliseconds: 600 + (index * 150)),
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, value, child) {
              return Transform.translate(
                offset: Offset(-30 * (1 - value), 0),
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_outline_rounded,
                    color: isDarkMode ? DarkAppColors.primary : Colors.white,
                    size: 18,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      point,
                      style: TextStyle(
                        fontSize: 13,
                        color: textColorSecondary,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}