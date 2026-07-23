// lib/features/booking/presentation/widgets/booking_time_picker.dart
import 'package:flutter/material.dart';
import '../../../models/booking_viewmodel.dart';

class BookingTimePicker extends StatelessWidget {
  final BookingViewModel vm;
  final bool dark;
  final Color neon;
  final Color card;
  final Color border;
  final VoidCallback onTap;

  const BookingTimePicker({
    super.key,
    required this.vm,
    required this.dark,
    required this.neon,
    required this.card,
    required this.border,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Time",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: dark ? Colors.white : Colors.white70,
              ),
            ),
            TextButton(
              onPressed: onTap,
              child: Text(
                "Change",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: neon,
                  fontSize: 12,
                  shadows: [
                    Shadow(
                      color: neon.withOpacity(0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(
              color: dark ? card : const Color(0xFF0A2E1F),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: border.withOpacity(0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: neon.withOpacity(0.08),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black.withOpacity(dark ? 0.3 : 0.1),
                  blurRadius: 15,
                  spreadRadius: 1,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: neon.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: neon.withOpacity(0.1),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.access_time_rounded,
                    color: neon,
                    size: 18,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  vm.selectedTime,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: dark ? Colors.white : Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: neon,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}