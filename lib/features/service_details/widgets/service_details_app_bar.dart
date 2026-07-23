import 'package:flutter/material.dart';
import '../../../../core/theme/dark_app_colors.dart';
import '../../../models/service_model.dart';

class ServiceDetailsAppBar extends StatelessWidget {
  final ServiceModel service;
  final bool isDarkMode;
  final Animation<Offset> imageSlideAnimation;

  const ServiceDetailsAppBar({
    super.key,
    required this.service,
    required this.isDarkMode,
    required this.imageSlideAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 340,
      pinned: true,
      elevation: 0,
      backgroundColor: isDarkMode ? DarkAppColors.background : Colors.white,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: isDarkMode
                ? Colors.white.withOpacity(0.1)
                : const Color(0xFF0A2E1F).withOpacity(0.08),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: isDarkMode ? DarkAppColors.primary : Colors.white,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Hero(
              tag: 'service_${service.id}',
              child: SlideTransition(
                position: imageSlideAnimation,
                child: Image.asset(
                  service.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: isDarkMode
                        ? DarkAppColors.card
                        : const Color(0xFF0A2E1F).withOpacity(0.08),
                    child: Icon(
                      Icons.broken_image,
                      size: 60,
                      color: isDarkMode
                          ? DarkAppColors.textHint
                          : const Color(0xFF0A2E1F).withOpacity(0.4),
                    ),
                  ),
                ),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.4),
                    Colors.transparent,
                    isDarkMode ? DarkAppColors.background : Colors.white,
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
            Positioned(
              left: 20,
              bottom: 20,
              right: 20,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 1000),
                tween: Tween(begin: 0.0, end: 1.0),
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 25 * (1 - value)),
                    child: Opacity(
                      opacity: value,
                      child: child,
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      service.name,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? DarkAppColors.primary : const Color(0xFF1D263B),
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      service.subtitle,
                      style: TextStyle(
                        fontSize: 15,
                        color: isDarkMode ? DarkAppColors.text : const Color(0xFF6B7280),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}