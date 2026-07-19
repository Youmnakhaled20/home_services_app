import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/review_model.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;

  const ReviewCard({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: 280,
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        // ✅ Dark: شفاف أقل (لون أكثر) - 15% بدل 8%
        color: isDark
            ? Colors.white.withOpacity(0.15)  // ✅ زيادة اللون
            : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: isDark
            ? Border.all(
          color: Colors.white.withOpacity(0.2),  // ✅ 20% بدل 10%
          width: 1.5,
        )
            : null,
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withOpacity(0.4)  // ✅ 40% بدل 60%
                : Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(review.image),
                backgroundColor: isDark ? Colors.grey[700] : Colors.grey[200],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  review.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: isDark ? Colors.white : AppColors.text,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text(
                review.rating.toString(),
                style: TextStyle(
                  color: isDark ? Colors.white : AppColors.text,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            review.comment,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isDark ? Colors.white.withOpacity(0.9) : AppColors.text,  // ✅ 90% بدل 80%
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}