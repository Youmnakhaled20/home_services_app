// lib/features/booking/presentation/widgets/booking_summary.dart
import 'package:flutter/material.dart';
import '../../../models/booking_viewmodel.dart';

class BookingSummary extends StatelessWidget {
  final BookingViewModel vm;
  final bool dark;
  final Color neon;
  final Color card;
  final Color border;

  const BookingSummary({
    super.key,
    required this.vm,
    required this.dark,
    required this.neon,
    required this.card,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    double travelCharge = 10.0;
    double totalAmount = vm.servicePrice + travelCharge;

    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: dark ? card : const Color(0xFF0A2E1F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: border.withOpacity(0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: neon.withOpacity(0.1),
            blurRadius: 40,
            spreadRadius: 5,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(dark ? 0.4 : 0.12),
            blurRadius: 30,
            spreadRadius: 3,
            offset: const Offset(0, 15),
          ),
          BoxShadow(
            color: neon.withOpacity(0.03),
            blurRadius: 80,
            spreadRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          _row("Service Fee", vm.servicePrice),
          const SizedBox(height: 10),
          _row("Travel Charge", travelCharge),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(
              color: Colors.white24,
              thickness: 0.5,
              height: 1,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Total Amount",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: neon.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: neon.withOpacity(0.1),
                      blurRadius: 15,
                    ),
                  ],
                ),
                child: Text(
                  "\$${totalAmount.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
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

  Widget _row(String title, double amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
        Text(
          "\$${amount.toStringAsFixed(2)}",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}