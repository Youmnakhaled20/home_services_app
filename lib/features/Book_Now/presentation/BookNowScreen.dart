// lib/features/booking/presentation/features/book_now_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../models/booking_viewmodel.dart';
import '../widgets/booking_app_bar.dart';
import '../widgets/booking_service_card.dart';
import '../widgets/booking_date_picker.dart';
import '../widgets/booking_time_picker.dart';
import '../widgets/booking_section_title.dart';
import '../widgets/booking_address.dart';
import '../widgets/booking_notes.dart';
import '../widgets/booking_summary.dart';
import '../widgets/booking_bottom_sheet.dart';
import '../widgets/booking_date_dialog.dart';
import '../widgets/booking_time_dialog.dart';

class BookNowScreen extends StatelessWidget {
  final String serviceName, serviceImage, duration, statLabel;
  final double servicePrice, rating;
  final IconData statIcon;

  const BookNowScreen({
    super.key,
    required this.serviceName,
    required this.servicePrice,
    required this.serviceImage,
    required this.statIcon,
    required this.statLabel,
    this.rating = 4.9,
    this.duration = "4 Hours",
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    const darkCard = Color(0xFF0F1C18);
    const darkBorder = Color(0xFF1E3A32);
    const darkNeon = Color(0xFF4FE3B2);
    const lightCard = Color(0xFF0A2E1F);
    const lightBorder = Color(0xFF1A4A3A);
    const lightNeon = Colors.white;

    return ChangeNotifierProvider(
      create: (_) => BookingViewModel(
        serviceName: serviceName,
        servicePrice: servicePrice,
        serviceImage: serviceImage,
        statIcon: statIcon,
        statLabel: statLabel,
        rating: rating,
        duration: duration,
      ),
      child: Consumer<BookingViewModel>(
        builder: (context, vm, _) => Scaffold(
          backgroundColor: isDark ? const Color(0xFF0A0A0A) : Colors.white,
          appBar: BookingAppBar(isDark: isDark),
          body: _buildBody(
            context,
            vm,
            isDark,
            isDark ? darkNeon : lightNeon,
            isDark ? darkCard : lightCard,
            isDark ? darkBorder : lightBorder,
          ),
          // ✅ إزالة onConfirm
          bottomSheet: BookingBottomSheet(
            vm: vm,
            isDark: isDark,
            neon: isDark ? darkNeon : lightNeon,
          ),
        ),
      ),
    );
  }

  Widget _buildBody(
      BuildContext context,
      BookingViewModel vm,
      bool dark,
      Color neon,
      Color card,
      Color border,
      ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookingServiceCard(
            vm: vm,
            dark: dark,
            neon: neon,
            card: card,
            border: border,
          ),
          const SizedBox(height: 28),
          BookingSectionTitle("Date & Time", dark),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: BookingDatePicker(
                  vm: vm,
                  dark: dark,
                  neon: neon,
                  card: card,
                  border: border,
                  onTap: () => BookingDateDialog.show(
                    context,
                    vm,
                    dark,
                    neon,
                    card,
                    border,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: BookingTimePicker(
                  vm: vm,
                  dark: dark,
                  neon: neon,
                  card: card,
                  border: border,
                  onTap: () => BookingTimeDialog.show(
                    context,
                    vm,
                    dark,
                    neon,
                    card,
                    border,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 28),
          BookingSectionTitle("Service Address", dark),
          const SizedBox(height: 12),
          BookingAddress(
            dark: dark,
            neon: neon,
            card: card,
            border: border,
          ),
          const SizedBox(height: 28),
          BookingSectionTitle("Special Instructions", dark),
          const SizedBox(height: 12),
          BookingNotes(
            vm: vm,
            dark: dark,
            card: card,
            border: border,
          ),
          const SizedBox(height: 28),
          BookingSectionTitle("Order Summary", dark),
          const SizedBox(height: 12),
          BookingSummary(
            vm: vm,
            dark: dark,
            neon: neon,
            card: card,
            border: border,
          ),
        ],
      ),
    );
  }
}