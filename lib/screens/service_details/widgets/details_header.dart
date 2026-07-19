import 'package:flutter/material.dart';

import '../../../../models/service_model.dart';
import 'details_info_chip.dart';

class DetailsHeader extends StatelessWidget {
  final ServiceModel service;

  const DetailsHeader({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          service.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF0A2E1F),
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            DetailsInfoChip(
              icon: Icons.star_rounded,
              text: service.rating.toString(),
              color: Colors.amber,
            ),
            const SizedBox(width: 10),
            DetailsInfoChip(
              icon: Icons.schedule,
              text: service.duration,
              color: const Color(0xFF0A2E1F),
            ),
          ],
        ),
      ],
    );
  }
}