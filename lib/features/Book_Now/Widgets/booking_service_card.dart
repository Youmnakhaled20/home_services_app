// lib/features/booking/presentation/widgets/booking_service_card.dart
import 'package:flutter/material.dart';
import '../../../models/booking_viewmodel.dart';

class BookingServiceCard extends StatelessWidget {
  final BookingViewModel vm;
  final bool dark;
  final Color neon;
  final Color card;
  final Color border;

  const BookingServiceCard({
    super.key,
    required this.vm,
    required this.dark,
    required this.neon,
    required this.card,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: card,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: border.withOpacity(0.3),
          width: 1,
        ),
        // ✅ إيفكت عالي - Glow & Shadow
        boxShadow: [
          BoxShadow(
            color: neon.withOpacity(0.15),
            blurRadius: 40,
            spreadRadius: 5,
            offset: const Offset(0, 10),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(dark ? 0.4 : 0.15),
            blurRadius: 30,
            spreadRadius: 2,
            offset: const Offset(0, 15),
          ),
          BoxShadow(
            color: neon.withOpacity(0.05),
            blurRadius: 80,
            spreadRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ✅ إيفكت على الصورة - Border Glow
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: neon.withOpacity(0.1),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                vm.serviceImage,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  height: 180,
                  color: Colors.grey[800],
                  child: const Icon(Icons.image, color: Colors.white, size: 40),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  vm.serviceName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: neon.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: neon.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      vm.rating.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: neon,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                vm.statIcon,
                size: 16,
                color: neon,
              ),
              const SizedBox(width: 6),
              Text(
                vm.statLabel,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
              const SizedBox(width: 16),
              Icon(
                Icons.access_time,
                size: 16,
                color: Colors.white70,
              ),
              const SizedBox(width: 6),
              Text(
                vm.duration,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 13,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: neon.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: neon.withOpacity(0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Text(
                  "\$${vm.servicePrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: neon,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}