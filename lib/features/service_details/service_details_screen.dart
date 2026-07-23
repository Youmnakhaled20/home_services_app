import 'package:flutter/material.dart';
import 'package:home_services_app/features/service_details/widgets/service_bottom_bar.dart';
import 'package:home_services_app/features/service_details/widgets/service_details_app_bar.dart';
import 'package:home_services_app/features/service_details/widgets/service_stats_row.dart';
import 'package:home_services_app/features/service_details/widgets/service_tabs_section.dart';


import '../../core/theme/dark_app_colors.dart';
import '../../models/service_model.dart';
class ServiceDetailsScreen extends StatefulWidget {
  final ServiceModel service;

  const ServiceDetailsScreen({
    super.key,
    required this.service,
  });

  @override
  State<ServiceDetailsScreen> createState() => _ServiceDetailsScreenState();
}

class _ServiceDetailsScreenState extends State<ServiceDetailsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _imageSlideAnimation;

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.7, curve: Curves.easeOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 80, end: 0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.1, 0.8, curve: Curves.easeOutBack),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0.75, end: 1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 0.9, curve: Curves.elasticOut),
      ),
    );

    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.25),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutCubic,
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onTabChanged(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final service = widget.service;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? DarkAppColors.background : Colors.white,
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                ServiceDetailsAppBar(
                  service: service,
                  isDarkMode: isDarkMode,
                  imageSlideAnimation: _imageSlideAnimation,
                ),
                SliverToBoxAdapter(
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, _slideAnimation.value),
                        child: Opacity(
                          opacity: _fadeAnimation.value.clamp(0.0, 1.0),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      color: isDarkMode ? DarkAppColors.background : Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ServiceStatsRow(
                            service: service,
                            isDarkMode: isDarkMode,
                            scaleAnimation: _scaleAnimation,
                          ),
                          const SizedBox(height: 24),
                          ServiceTabsSection(
                            selectedTab: _selectedTab,
                            onTabChanged: _onTabChanged,
                            service: service,
                            isDarkMode: isDarkMode,
                          ),
                          const SizedBox(height: 130),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ServiceBottomBar(
              service: service,
              isDarkMode: isDarkMode,
            ),
          ],
        ),
      ),
    );
  }
}