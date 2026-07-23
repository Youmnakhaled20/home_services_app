import 'package:flutter/material.dart';
import '../../../data/reviews_data.dart';
import 'review_card.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Customer Feedback",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : const Color(0xFF111111),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: reviews.length,
            itemBuilder: (context, index) {
              return ReviewCard(
                review: reviews[index],
              );
            },
          ),
        ),
      ],
    );
  }
}