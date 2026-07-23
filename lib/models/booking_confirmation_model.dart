// lib/models/booking_confirmation_model.dart
class BookingConfirmationModel {
  final String serviceName;
  final String bookingId;
  final String date;
  final String time;
  final String address;
  final String proName;
  final double proRating;
  final double totalAmount;
  final String transactionId;

  BookingConfirmationModel({
    required this.serviceName,
    required this.bookingId,
    required this.date,
    required this.time,
    required this.address,
    required this.proName,
    required this.proRating,
    required this.totalAmount,
    required this.transactionId,
  });
}