// lib/features/service_listing/widgets/rating_chip.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';

class RatingChip extends StatelessWidget {
  final double rating;
  const RatingChip({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, size: 16, color: Colors.amber),
          const SizedBox(width: 4),
          Text(
            rating.toString(),
            style: AppTextStyles.labelSmall(context).copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}