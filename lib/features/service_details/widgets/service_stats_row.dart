import 'package:flutter/material.dart';
import '../../../../core/theme/dark_app_colors.dart';
import '../../../models/service_model.dart';
class ServiceStatsRow extends StatelessWidget {
  final ServiceModel service;
  final bool isDarkMode;
  final Animation<double> scaleAnimation;

  const ServiceStatsRow({
    super.key,
    required this.service,
    required this.isDarkMode,
    required this.scaleAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Row(
        children: [
          _buildStatCard(
            Icons.star_rounded,
            service.rating.toString(),
            '${service.reviewsCount}\nReviews',
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            Icons.access_time_rounded,
            service.duration.split(' ').first,
            '${service.duration.split(' ').skip(1).join(' ')}\nDuration',
          ),
          const SizedBox(width: 12),
          _buildStatCard(
            service.statIcon,
            '100%',
            '${service.statLabel.split(' ').first}\n${service.statLabel.split(' ').skip(1).join(' ')}',
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(IconData icon, String value, String label) {
    return Expanded(
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 900),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, animValue, child) {
          return Transform.scale(
            scale: 0.8 + (0.2 * animValue),
            child: Opacity(
              opacity: animValue,
              child: child,
            ),
          );
        },
        child: Container(
          height: 110,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
          decoration: BoxDecoration(
            color: isDarkMode ? DarkAppColors.card : const Color(0xFF0A2E1F),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDarkMode ? DarkAppColors.border : Colors.transparent,
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isDarkMode ? DarkAppColors.primary : Colors.white,
                size: 20,
              ),
              const SizedBox(height: 6),
              Text(
                value,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: isDarkMode ? DarkAppColors.text : Colors.white,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  height: 1.1,
                  color: isDarkMode ? DarkAppColors.textSecondary : Colors.white70,
                ),
                maxLines: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}