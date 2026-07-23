// lib/features/booking/presentation/widgets/booking_app_bar.dart
import 'package:flutter/material.dart';

class BookingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isDark;

  const BookingAppBar({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final isLight = !isDark;

    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Booking",
        style: TextStyle(
          color: isDark
              ? const Color(0xFF4FE3B2)
              : const Color(0xFF0A2E1F),
          fontWeight: FontWeight.w600,
          fontSize: 18,
          letterSpacing: 0.5,
        ),
      ),
      leading: _iconButton(
        Icons.arrow_back_rounded,
        isDark,
            () => Navigator.pop(context),
      ),
      actions: [
        _iconButton(Icons.favorite_border_rounded, isDark, () {}),
      ],
    );
  }

  Widget _iconButton(IconData icon, bool dark, VoidCallback onTap) {
    final isLight = !dark;

    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: isLight
            ? const Color(0xFF0A2E1F).withOpacity(0.06)
            : Colors.white.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isLight ? const Color(0xFF0A2E1F) : Colors.white,
          size: 22,
        ),
        onPressed: onTap,
        padding: EdgeInsets.zero,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}