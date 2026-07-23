// lib/features/booking/presentation/widgets/confirmed_divider.dart
import 'package:flutter/material.dart';

class ConfirmedDivider extends StatelessWidget {
  const ConfirmedDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonColor = const Color(0xFF4FE3B2);
    final white = Colors.white;

    return Divider(
      color: isDark ? neonColor.withOpacity(0.1) : white.withOpacity(0.12),
      thickness: 0.5,
    );
  }
}