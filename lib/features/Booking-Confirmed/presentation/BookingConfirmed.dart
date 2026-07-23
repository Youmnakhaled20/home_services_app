// lib/features/booking/presentation/features/booking_confirmed_screen.dart
import 'package:flutter/material.dart';
import '../../../models/booking_confirmation_model.dart';
import '../Widgets/ConfirmedBackButton.dart';
import '../Widgets/confirmed_badge.dart';
import '../Widgets/confirmed_details_card.dart';
import '../Widgets/confirmed_footer.dart';
import '../Widgets/confirmed_success_icon.dart';
import '../Widgets/confirmed_title.dart';
class BookingConfirmedScreen extends StatelessWidget {
  final BookingConfirmationModel data;

  const BookingConfirmedScreen({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF0A0A0A) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isDark ? const Color(0xFF4FE3B2) : const Color(0xFF0A2E1F),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const ConfirmedSuccessIcon(),
              const SizedBox(height: 20),
              const ConfirmedTitle(),
              const SizedBox(height: 12),
              const ConfirmedBadge(),
              const SizedBox(height: 28),
              ConfirmedDetailsCard(data: data),
              const SizedBox(height: 32),
              const ConfirmedBackButton(),
              const SizedBox(height: 24),
              const ConfirmedFooter(),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}