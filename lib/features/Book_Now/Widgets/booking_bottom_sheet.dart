// lib/features/booking/presentation/widgets/booking_bottom_sheet.dart
import 'package:flutter/material.dart';
import '../../../models/booking_viewmodel.dart';
import '../../../models/booking_confirmation_model.dart';
import '../../Booking-Confirmed/presentation/BookingConfirmed.dart';
class BookingBottomSheet extends StatelessWidget {
  final BookingViewModel vm;
  final bool isDark;
  final Color neon;

  const BookingBottomSheet({
    super.key,
    required this.vm,
    required this.isDark,
    required this.neon,
  });

  @override
  Widget build(BuildContext context) {
    final isLight = !isDark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        color: isLight ? Colors.white : const Color(0xFF0F1C18),
        boxShadow: [
          BoxShadow(
            color: isLight
                ? Colors.grey.withOpacity(0.08)
                : neon.withOpacity(0.1),
            blurRadius: 50,
            spreadRadius: 10,
            offset: const Offset(0, -10),
          ),
          BoxShadow(
            color: isLight
                ? Colors.grey.withOpacity(0.05)
                : Colors.black.withOpacity(0.4),
            blurRadius: 30,
            spreadRadius: 5,
            offset: const Offset(0, -8),
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Total Payable",
                  style: TextStyle(
                    fontSize: 11,
                    color: isLight ? const Color(0xFF4A6A5A) : Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "\$${vm.getTotalAmount().toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isLight ? const Color(0xFF0A2E1F) : Colors.white,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: isLight
                        ? const Color(0xFF0A2E1F).withOpacity(0.2)
                        : neon.withOpacity(0.3),
                    blurRadius: 25,
                    spreadRadius: 2,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // ✅ إنشاء Booking ID
                    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
                    final bookingId = "#LX-${timestamp.substring(timestamp.length - 6)}";
                    final transactionId = "LX-${timestamp.substring(timestamp.length - 6)}-B";

                    // ✅ حفظ البيانات في الـ ViewModel
                    vm.setConfirmedData(
                      serviceName: vm.serviceName,
                      bookingId: bookingId,
                      date: vm.formatDate(vm.selectedDate),
                      time: vm.selectedTime,
                      address: "123 Apple Street, Cupertino, CA 95014",
                      proName: "Marcus Thorne",
                      proRating: 4.9,
                      totalAmount: vm.getTotalAmount(),
                      transactionId: transactionId,
                    );

                    // ✅ إنشاء Model البيانات
                    final confirmationData = BookingConfirmationModel(
                      serviceName: vm.confirmedServiceName,
                      bookingId: vm.confirmedBookingId,
                      date: vm.confirmedDate,
                      time: vm.confirmedTime,
                      address: vm.confirmedAddress,
                      proName: vm.confirmedProName,
                      proRating: vm.confirmedProRating,
                      totalAmount: vm.confirmedTotalAmount,
                      transactionId: vm.confirmedTransactionId,
                    );
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingConfirmedScreen(
                          data: confirmationData,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isLight
                        ? const Color(0xFF0A2E1F)
                        : neon,
                    foregroundColor: isLight ? Colors.white : Colors.black,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Text(
                    "Confirm Booking",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isLight ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}