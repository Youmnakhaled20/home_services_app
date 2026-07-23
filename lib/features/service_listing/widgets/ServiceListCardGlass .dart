// lib/features/service_listing/widgets/ServiceListCardGlass.dart
import 'package:flutter/material.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/service_model.dart';
import 'price_section.dart';
import 'view_details_button.dart';

class ServiceCard extends StatelessWidget {
  final ServiceModel service;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.service,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        // ✅ أخضر غامق مائل للشفافية في الدارك والليت
        color: isDark
            ? const Color(0xFF0F1C18) // أخضر غامق في الدارك
            : const Color(0xFF0A2E1F).withOpacity(0.95), // أخضر غامق شفاف في الليت
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isDark
              ? AppColors.darkBorder.withOpacity(0.6)
              : const Color(0xFF1A4A3A).withOpacity(0.3),
          width: isDark ? 1.5 : 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
          if (isDark)
            BoxShadow(
              color: AppColors.darkNeon.withOpacity(0.05),
              blurRadius: 40,
              spreadRadius: 5,
            ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: AspectRatio(
                    aspectRatio: 16 / 10,
                    child: Image.asset(
                      service.image,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: Colors.grey[200],
                        child: const Icon(Icons.broken_image, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: isDark ? AppColors.darkNeon : const Color(0xFF0A2E1F),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.grid_view_rounded,
                      color: isDark ? Colors.black : Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              service.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.headlineSmall(context).copyWith(
                color: Colors.white, // ✅ أبيض في الاتنين
              ),
            ),
            const SizedBox(height: 6),
            Text(
              service.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.bodyMedium(context).copyWith(
                color: Colors.white70,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: PriceSection(price: service.price),
                ),
                const SizedBox(width: 12),
                ViewDetailsButton(service: service),
              ],
            ),
          ],
        ),
      ),
    );
  }
}