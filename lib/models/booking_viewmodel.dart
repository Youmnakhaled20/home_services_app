// lib/features/booking/presentation/viewmodel/booking_viewmodel.dart
import 'package:flutter/material.dart';

class BookingViewModel extends ChangeNotifier {
  // البيانات الأساسية
  final String serviceName;
  final double servicePrice;
  final String serviceImage;
  final double rating;
  final String duration;
  final IconData statIcon;
  final String statLabel;

  // التاريخ
  DateTime _selectedDate = DateTime.now();
  DateTime _tempSelectedDate = DateTime.now();

  // الوقت
  String _selectedTime = "11:00 AM";
  int _selectedHour = 11;
  int _selectedMinute = 0;
  bool _isAM = true;

  // وقت مؤقت للـ Dialog
  int _tempHour = 11;
  int _tempMinute = 0;
  bool _tempIsAM = true;

  // الملاحظات
  final TextEditingController notesController = TextEditingController();

  // ✅ بيانات التأكيد
  String _confirmedServiceName = "";
  String _confirmedBookingId = "";
  String _confirmedDate = "";
  String _confirmedTime = "";
  String _confirmedAddress = "";
  String _confirmedProName = "";
  double _confirmedProRating = 0.0;
  double _confirmedTotalAmount = 0.0;
  String _confirmedTransactionId = "";

  BookingViewModel({
    required this.serviceName,
    required this.servicePrice,
    required this.serviceImage,
    required this.statIcon,
    required this.statLabel,
    this.rating = 4.9,
    this.duration = "4 Hours",
  });

  // Getters
  DateTime get selectedDate => _selectedDate;
  DateTime get tempSelectedDate => _tempSelectedDate;
  String get selectedTime => _selectedTime;
  int get selectedHour => _selectedHour;
  int get selectedMinute => _selectedMinute;
  bool get isAM => _isAM;
  int get tempHour => _tempHour;
  int get tempMinute => _tempMinute;
  bool get tempIsAM => _tempIsAM;

  // ✅ Getters للتأكيد
  String get confirmedServiceName => _confirmedServiceName;
  String get confirmedBookingId => _confirmedBookingId;
  String get confirmedDate => _confirmedDate;
  String get confirmedTime => _confirmedTime;
  String get confirmedAddress => _confirmedAddress;
  String get confirmedProName => _confirmedProName;
  double get confirmedProRating => _confirmedProRating;
  double get confirmedTotalAmount => _confirmedTotalAmount;
  String get confirmedTransactionId => _confirmedTransactionId;

  // Setters للتاريخ
  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void setTempSelectedDate(DateTime date) {
    _tempSelectedDate = date;
    notifyListeners();
  }

  // Setters للوقت
  void setSelectedTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }

  void setSelectedHour(int hour) {
    _selectedHour = hour;
    notifyListeners();
  }

  void setSelectedMinute(int minute) {
    _selectedMinute = minute;
    notifyListeners();
  }

  void setIsAM(bool am) {
    _isAM = am;
    notifyListeners();
  }

  void setTempHour(int hour) {
    _tempHour = hour;
    notifyListeners();
  }

  void setTempMinute(int minute) {
    _tempMinute = minute;
    notifyListeners();
  }

  void setTempIsAM(bool am) {
    _tempIsAM = am;
    notifyListeners();
  }

  // ✅ دالة حفظ بيانات التأكيد
  void setConfirmedData({
    required String serviceName,
    required String bookingId,
    required String date,
    required String time,
    required String address,
    required String proName,
    required double proRating,
    required double totalAmount,
    required String transactionId,
  }) {
    _confirmedServiceName = serviceName;
    _confirmedBookingId = bookingId;
    _confirmedDate = date;
    _confirmedTime = time;
    _confirmedAddress = address;
    _confirmedProName = proName;
    _confirmedProRating = proRating;
    _confirmedTotalAmount = totalAmount;
    _confirmedTransactionId = transactionId;
    notifyListeners();
  }

  // دوال مساعدة
  String formatTime(int hour, int minute, bool am) {
    int displayHour = hour;
    if (displayHour > 12) displayHour -= 12;
    if (displayHour == 0) displayHour = 12;
    return "${displayHour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')} ${am ? "AM" : "PM"}";
  }

  void parseTime(String time) {
    final parts = time.split(' ');
    final timeParts = parts[0].split(':');
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);
    bool am = parts[1] == "AM";

    if (!am && hour != 12) hour += 12;
    if (am && hour == 12) hour = 0;

    _selectedHour = hour;
    _selectedMinute = minute;
    _isAM = am;
  }

  String formatDate(DateTime date) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return '${date.day} ${months[date.month - 1]} ${date.year}';
  }

  String getMonthYear(DateTime date) {
    const months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];
    return '${months[date.month - 1]} ${date.year}';
  }

  int getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  String getDayName(int weekday) {
    switch (weekday) {
      case 1: return "Monday";
      case 2: return "Tuesday";
      case 3: return "Wednesday";
      case 4: return "Thursday";
      case 5: return "Friday";
      case 6: return "Saturday";
      case 7: return "Sunday";
      default: return "";
    }
  }

  double getTotalAmount() {
    return servicePrice + 10.0;
  }

  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }
}