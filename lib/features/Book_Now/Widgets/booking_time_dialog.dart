// lib/features/booking/presentation/widgets/booking_time_dialog.dart
import 'package:flutter/material.dart';
import 'dart:math';
import '../../../models/booking_viewmodel.dart';
import 'analog_clock_painter.dart';

class BookingTimeDialog {
  static void show(
      BuildContext context,
      BookingViewModel vm,
      bool dark,
      Color neon,
      Color card,
      Color border,
      ) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: dark ? card : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.all(24),
                width: 400,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Select Time",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: dark ? Colors.white : const Color(0xFF1A1A1A),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      vm.formatTime(vm.tempHour, vm.tempMinute, vm.tempIsAM),
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: dark ? neon : const Color(0xFF235347),
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onPanUpdate: (details) {
                        final box = context.findRenderObject() as RenderBox;
                        final center = box.size.center(Offset.zero);
                        final localPosition = details.localPosition;

                        double dx = localPosition.dx - center.dx;
                        double dy = localPosition.dy - center.dy;

                        double angle = atan2(dy, dx);

                        double totalMinutes = ((angle + pi / 2) / (2 * pi)) * 12 * 60;
                        if (totalMinutes < 0) totalMinutes += 12 * 60;

                        int hours = (totalMinutes ~/ 60) % 12;
                        int minutes = (totalMinutes % 60).round();

                        if (hours == 0) hours = 12;
                        if (minutes >= 60) minutes = 0;

                        setState(() {
                          if (!vm.tempIsAM && hours != 12) {
                            vm.setTempHour(hours + 12);
                          } else if (vm.tempIsAM && hours == 12) {
                            vm.setTempHour(0);
                          } else {
                            vm.setTempHour(hours);
                          }
                          vm.setTempMinute(minutes);
                        });
                      },
                      child: CustomPaint(
                        size: const Size(280, 280),
                        painter: AnalogClockPainter(
                          hour: vm.tempHour,
                          minute: vm.tempMinute,
                          isDark: dark,
                          neonColor: neon,
                          darkBorderColor: border,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _amPmButton(
                          "AM",
                          true,
                          vm.tempIsAM,
                          dark,
                          neon,
                              () {
                            setState(() {
                              vm.setTempIsAM(true);
                              if (vm.tempHour >= 12) {
                                vm.setTempHour(vm.tempHour - 12);
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        _amPmButton(
                          "PM",
                          false,
                          vm.tempIsAM,
                          dark,
                          neon,
                              () {
                            setState(() {
                              vm.setTempIsAM(false);
                              if (vm.tempHour < 12) {
                                vm.setTempHour(vm.tempHour + 12);
                              }
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          vm.setSelectedHour(vm.tempHour);
                          vm.setSelectedMinute(vm.tempMinute);
                          vm.setIsAM(vm.tempIsAM);
                          vm.setSelectedTime(
                            vm.formatTime(vm.tempHour, vm.tempMinute, vm.tempIsAM),
                          );
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: dark ? neon : const Color(0xFF235347),
                          foregroundColor: dark ? Colors.black : Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "OK",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }

  static Widget _amPmButton(
      String label,
      bool isAM,
      bool currentIsAM,
      bool dark,
      Color neon,
      VoidCallback onTap,
      ) {
    bool selected = isAM == currentIsAM;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? (dark ? neon : const Color(0xFF235347))
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected
                ? Colors.transparent
                : (dark ? const Color(0xFF1E3A32) : Colors.grey.withOpacity(0.3)),
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: selected
                ? (dark ? Colors.black : Colors.white)
                : (dark ? Colors.white : const Color(0xFF1A1A1A)),
          ),
        ),
      ),
    );
  }
}