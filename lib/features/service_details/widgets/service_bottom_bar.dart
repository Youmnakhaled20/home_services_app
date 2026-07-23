import 'package:flutter/material.dart';
import '../../../../core/theme/dark_app_colors.dart';
import '../../../models/service_model.dart';
import '../../Book_Now/presentation/BookNowScreen.dart';

class ServiceBottomBar extends StatelessWidget {
  final ServiceModel service;
  final bool isDarkMode;

  const ServiceBottomBar({
    super.key,
    required this.service,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: TweenAnimationBuilder<double>(
        duration: const Duration(milliseconds: 1200),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, 60 * (1 - value)),
            child: Opacity(
              opacity: value,
              child: child,
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          decoration: BoxDecoration(
            color: isDarkMode ? const Color(0xFF161616) : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 24,
                offset: const Offset(0, -6),
              ),
            ],
          ),
          child: Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TOTAL PRICE',
                    style: TextStyle(
                      fontSize: 10,
                      color: isDarkMode
                          ? DarkAppColors.textHint
                          : const Color(0xFF0A2E1F).withOpacity(0.5),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.8,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        service.price.replaceAll(RegExp(r'[^0-9]'), ''),
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? DarkAppColors.primary : const Color(0xFF0A2E1F),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'EGP',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? DarkAppColors.primary : const Color(0xFF0A2E1F),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '/ service',
                        style: TextStyle(
                          fontSize: 11,
                          color: isDarkMode
                              ? DarkAppColors.textHint
                              : const Color(0xFF0A2E1F).withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    double priceValue = double.tryParse(
                      service.price.replaceAll(RegExp(r'[^0-9.]'), ''),
                    ) ??
                        0.0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookNowScreen(
                          serviceName: service.name,
                          servicePrice: priceValue,
                          serviceImage: service.image,
                          statIcon: service.statIcon,
                          statLabel: service.statLabel,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDarkMode ? DarkAppColors.primary : const Color(0xFF0A2E1F),
                    foregroundColor: isDarkMode ? DarkAppColors.buttonText : Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 18,
                        color: isDarkMode ? DarkAppColors.buttonText : Colors.white,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Book Now',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDarkMode ? DarkAppColors.buttonText : Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}