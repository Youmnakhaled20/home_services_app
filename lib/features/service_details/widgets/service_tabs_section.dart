import 'package:flutter/material.dart';
import 'package:home_services_app/features/service_details/widgets/service_description_content.dart';
import 'package:home_services_app/features/service_details/widgets/service_included_content.dart';
import '../../../../core/theme/dark_app_colors.dart';
import '../../../models/service_model.dart' show ServiceModel;
class ServiceTabsSection extends StatelessWidget {
  final int selectedTab;
  final ValueChanged<int> onTabChanged;
  final ServiceModel service;
  final bool isDarkMode;

  const ServiceTabsSection({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
    required this.service,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            _buildTabItem('Description', 0),
            const SizedBox(width: 28),
            _buildTabItem('What\'s Included', 1),
          ],
        ),
        const SizedBox(height: 16),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          switchInCurve: Curves.easeOutBack,
          switchOutCurve: Curves.easeIn,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 0.92, end: 1).animate(animation),
                  child: child,
                ),
              ),
            );
          },
          child: _buildTabContent(),
        ),
      ],
    );
  }

  Widget _buildTabItem(String label, int index) {
    final isActive = selectedTab == index;

    return GestureDetector(
      onTap: () => onTabChanged(index),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
              color: isActive
                  ? (isDarkMode ? DarkAppColors.primary : const Color(0xFF0A2E1F))
                  : (isDarkMode ? DarkAppColors.textSecondary : Colors.grey),
            ),
            child: Text(label),
          ),
          const SizedBox(height: 6),
          AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            height: 3,
            width: isActive ? 36 : 0,
            decoration: BoxDecoration(
              color: isDarkMode ? DarkAppColors.primary : const Color(0xFF0A2E1F),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeOutCubic,
      key: ValueKey<int>(selectedTab),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? DarkAppColors.cardGreen : const Color(0xFF0A2E1F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isDarkMode ? DarkAppColors.border : Colors.transparent,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: selectedTab == 0
          ? ServiceDescriptionContent(service: service, isDarkMode: isDarkMode)
          : ServiceIncludedContent(service: service, isDarkMode: isDarkMode),
    );
  }
}