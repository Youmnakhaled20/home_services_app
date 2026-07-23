// lib/features/booking/presentation/widgets/booking_notes.dart
import 'package:flutter/material.dart';
import '../../../models/booking_viewmodel.dart';

class BookingNotes extends StatelessWidget {
  final BookingViewModel vm;
  final bool dark;
  final Color card;
  final Color border;

  const BookingNotes({
    super.key,
    required this.vm,
    required this.dark,
    required this.card,
    required this.border,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dark ? card : const Color(0xFF0A2E1F),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: border.withOpacity(0.3),
          width: 1,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(dark ? 0.3 : 0.08),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child:TextField(
        controller: vm.notesController,
        maxLines: 3,
        style: const TextStyle(
          color: Colors.white,
        ),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          filled: true,
          fillColor: dark ? card : const Color(0xFF0A2E1F),
          hintText: "Add any special notes for the service provider...",
          hintStyle: const TextStyle(
            color: Colors.white70,
            fontSize: 14,
          ),
          contentPadding: const EdgeInsets.all(16),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}