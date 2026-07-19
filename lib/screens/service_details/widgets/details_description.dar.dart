import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/service_model.dart';

class DetailsDescription extends StatelessWidget {
  final ServiceModel service;

  const DetailsDescription({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF0A2E1F),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          service.description,
          style: TextStyle(
            fontSize: 15,
            color: isDark ? Colors.white.withOpacity(0.9) : const Color(0xFF0A2E1F),
            height: 1.6,
          ),
        ),
      ],
    );
  }
}