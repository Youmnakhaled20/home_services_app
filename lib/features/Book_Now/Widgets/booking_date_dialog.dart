// lib/features/booking/presentation/widgets/booking_date_dialog.dart
import 'package:flutter/material.dart';
import '../../../models/booking_viewmodel.dart';

class BookingDateDialog {
  static void show(
      BuildContext context,
      BookingViewModel vm,
      bool dark,
      Color neon,
      Color card,
      Color border,
      ) {
    vm.setTempSelectedDate(vm.selectedDate);

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: dark ? card : Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: StatefulBuilder(
            builder: (context, setState) {
              return Container(
                padding: const EdgeInsets.all(24),
                width: 350,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          color: dark ? neon : const Color(0xFF0A2E1F),
                          size: 24,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "Select Date",
                          style: TextStyle(
                            color: dark ? Colors.white : const Color(0xFF1A1A1A),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              vm.setTempSelectedDate(
                                DateTime(
                                  vm.tempSelectedDate.year,
                                  vm.tempSelectedDate.month - 1,
                                  1,
                                ),
                              );
                            });
                          },
                          icon: Icon(
                            Icons.chevron_left,
                            color: dark ? Colors.white : const Color(0xFF1A1A1A),
                            size: 28,
                          ),
                        ),
                        Text(
                          vm.getMonthYear(vm.tempSelectedDate),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: dark ? Colors.white : const Color(0xFF1A1A1A),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              vm.setTempSelectedDate(
                                DateTime(
                                  vm.tempSelectedDate.year,
                                  vm.tempSelectedDate.month + 1,
                                  1,
                                ),
                              );
                            });
                          },
                          icon: Icon(
                            Icons.chevron_right,
                            color: dark ? Colors.white : const Color(0xFF1A1A1A),
                            size: 28,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                            .map((day) => SizedBox(
                          width: 36,
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: dark ? Colors.grey[400] : Colors.grey[600],
                            ),
                          ),
                        ))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: 310,
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: List.generate(
                          vm.getDaysInMonth(vm.tempSelectedDate),
                              (index) {
                            final day = index + 1;
                            final date = DateTime(
                              vm.tempSelectedDate.year,
                              vm.tempSelectedDate.month,
                              day,
                            );
                            final isToday = date.day == DateTime.now().day &&
                                date.month == DateTime.now().month &&
                                date.year == DateTime.now().year;
                            final isSelected = date.day == vm.tempSelectedDate.day &&
                                date.month == vm.tempSelectedDate.month &&
                                date.year == vm.tempSelectedDate.year;
                            final isPast = date.isBefore(DateTime(
                              DateTime.now().year,
                              DateTime.now().month,
                              DateTime.now().day,
                            ));

                            return GestureDetector(
                              onTap: isPast
                                  ? null
                                  : () {
                                setState(() {
                                  vm.setTempSelectedDate(date);
                                });
                              },
                              child: Container(
                                width: 38,
                                height: 38,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? (dark ? neon : const Color(0xFF0A2E1F))
                                      : (isToday && !isSelected
                                      ? (dark
                                      ? neon.withOpacity(0.15)
                                      : const Color(0xFF0A2E1F)
                                      .withOpacity(0.08))
                                      : Colors.transparent),
                                  borderRadius: BorderRadius.circular(8),
                                  border: isToday && !isSelected
                                      ? Border.all(
                                    color: dark
                                        ? neon.withOpacity(0.4)
                                        : const Color(0xFF0A2E1F)
                                        .withOpacity(0.3),
                                    width: 1.5,
                                  )
                                      : null,
                                ),
                                child: Center(
                                  child: Text(
                                    day.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight:
                                      isSelected ? FontWeight.bold : FontWeight.normal,
                                      color: isPast
                                          ? (dark
                                          ? Colors.grey[600]
                                          : Colors.grey[400])
                                          : (isSelected
                                          ? (dark
                                          ? Colors.black
                                          : Colors.white)
                                          : (dark
                                          ? Colors.white
                                          : const Color(0xFF1A1A1A))),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                color: dark ? Colors.grey[400] : Colors.grey[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              vm.setSelectedDate(vm.tempSelectedDate);
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: dark ? neon : const Color(0xFF0A2E1F),
                              foregroundColor: dark ? Colors.black : Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Select",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
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
}