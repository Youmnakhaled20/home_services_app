// lib/features/booking/presentation/widgets/confirmed_details_card.dart
import 'package:flutter/material.dart';
import '../../../models/booking_confirmation_model.dart';
import 'confirmed_info_row.dart';
import 'confirmed_divider.dart';

class ConfirmedDetailsCard extends StatelessWidget {
  final BookingConfirmationModel data;

  const ConfirmedDetailsCard({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonColor = const Color(0xFF4FE3B2);
    final cardColor = isDark ? const Color(0xFF0F1C18) : const Color(0xFF0A2E1F);
    final borderColor = isDark ? const Color(0xFF1E3A32) : const Color(0xFF1A4A3A);
    final white = Colors.white;
    final white70 = Colors.white70;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDark ? neonColor.withOpacity(0.15) : borderColor,
          width: isDark ? 1.5 : 1,
        ),
        boxShadow: [
          if (isDark)
            BoxShadow(
              color: neonColor.withOpacity(0.05),
              blurRadius: 60,
              spreadRadius: 10,
            ),
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.06),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConfirmedInfoRow(label: "SERVICE", value: data.serviceName),
          const SizedBox(height: 12),
          const ConfirmedDivider(),
          const SizedBox(height: 12),
          ConfirmedInfoRow(label: "BOOKING ID", value: data.bookingId),
          const SizedBox(height: 12),
          const ConfirmedDivider(),
          const SizedBox(height: 12),
          ConfirmedInfoRow(label: "Date", value: data.date),
          const SizedBox(height: 4),
          ConfirmedInfoRow(label: "Time", value: data.time),
          const SizedBox(height: 12),
          const ConfirmedDivider(),
          const SizedBox(height: 12),
          ConfirmedInfoRow(label: "SERVICE ADDRESS", value: data.address, isLong: true),
          const SizedBox(height: 12),
          const ConfirmedDivider(),
          const SizedBox(height: 12),
          _buildProRow(context),
          const SizedBox(height: 12),
          const ConfirmedDivider(),
          const SizedBox(height: 12),
          _buildTotalRow(context),
        ],
      ),
    );
  }

  Widget _buildProRow(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonColor = const Color(0xFF4FE3B2);
    final white = Colors.white;
    final white70 = Colors.white70;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Assigned Pro",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[400] : white70,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              data.proName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? neonColor : white,
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Icon(Icons.star_rounded, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text(
              data.proRating.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: isDark ? neonColor : white,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTotalRow(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final neonColor = const Color(0xFF4FE3B2);
    final darkGreen = const Color(0xFF0A2E1F);
    final white = Colors.white;
    final white70 = Colors.white70;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Total Paid",
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isDark ? Colors.grey[400] : white70,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "\$${data.totalAmount.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isDark ? neonColor : darkGreen,
                shadows: isDark ? [
                  Shadow(color: neonColor.withOpacity(0.3), blurRadius: 15),
                ] : null,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: isDark ? neonColor.withOpacity(0.08) : white.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8),
            border: isDark ? Border.all(
              color: neonColor.withOpacity(0.1),
              width: 1,
            ) : null,
          ),
          child: Text(
            "ID: ${data.transactionId}",
            style: TextStyle(
              fontSize: 10,
              color: isDark ? neonColor : white70,
            ),
          ),
        ),
      ],
    );
  }
}