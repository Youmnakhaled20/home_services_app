// lib/features/service_listing/widgets/view_details_button.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/service_model.dart';
import '../../service_details/service_details_screen.dart';

class ViewDetailsButton extends StatelessWidget {
  final ServiceModel service;

  const ViewDetailsButton({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SizedBox(
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ServiceDetailsScreen(service: service),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: isDark ? AppColors.darkNeon : const Color(0xFF235347),
          foregroundColor: isDark ? Colors.black : Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          "View Details",
          style: AppTextStyles.buttonSmall(context).copyWith(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}