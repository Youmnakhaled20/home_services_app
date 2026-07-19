import 'package:flutter/material.dart';

class DetailsIncluded extends StatelessWidget {
  const DetailsIncluded({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Professional Service',
      'Quality Guaranteed',
      'Experienced Team',
      'Best Price Guarantee',
      'Satisfaction Guaranteed',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What\'s Included',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A2E1F),
          ),
        ),
        const SizedBox(height: 8),
        ...items.map((item) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const Icon(
                  Icons.check_circle,
                  size: 18,
                  color: Colors.green,
                ),
                const SizedBox(width: 10),
                Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF0A2E1F),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }
}