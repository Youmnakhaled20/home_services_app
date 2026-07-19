import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/service_model.dart';

class DetailsPrice extends StatelessWidget {
  final ServiceModel service;

  const DetailsPrice({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withOpacity(0.08)
            : const Color(0xFF0A2E1F).withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark
              ? Colors.white.withOpacity(0.15)
              : const Color(0xFF0A2E1F).withOpacity(0.15),
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Price',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isDark ? Colors.white : const Color(0xFF0A2E1F),
            ),
          ),
          Text(
            service.price,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.white : const Color(0xFF0A2E1F),
            ),
          ),
        ],
      ),
    );
  }
}