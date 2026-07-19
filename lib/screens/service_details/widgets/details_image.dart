import 'package:flutter/material.dart';

import '../../../../models/service_model.dart';

class DetailsImage extends StatelessWidget {
  final ServiceModel service;

  const DetailsImage({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'service_${service.id}',
      child: Image.asset(
        service.image,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: const Color(0xFF0A2E1F),
          child: const Icon(
            Icons.broken_image,
            size: 60,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}