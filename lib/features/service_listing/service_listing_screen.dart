import 'package:flutter/material.dart';
import 'package:home_services_app/features/service_listing/widgets/ServiceListCardGlass%20.dart';
import '../../core/theme/app_text_styles.dart';
import '../../models/category_model.dart';
import '../../models/service_model.dart';
import 'widgets/category_banner.dart';

class ServiceListingScreen extends StatefulWidget {
  final CategoryModel category;

  const ServiceListingScreen({super.key, required this.category});

  @override
  State<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  late List<ServiceModel> filteredServices;

  @override
  void initState() {
    super.initState();
    filteredServices = widget.category.services;
  }

  void _filterServices(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredServices = widget.category.services;
      } else {
        filteredServices = widget.category.services
            .where((s) => s.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? const Color(0xFF111111) : const Color(0xFFF7F8F5);

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CategoryBanner(
              title: widget.category.title,
              image: widget.category.heroImage,
              servicesCount: filteredServices.length,
              onSearch: _filterServices,
            ),
          ),
          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -30),
              child: Container(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: const SizedBox(height: 10),
              ),
            ),
          ),
          filteredServices.isEmpty
              ? SliverFillRemaining(
            child: Center(
              child: Text(
                "No services found",
                style: AppTextStyles.bodyLarge(context).copyWith(
                  color: isDark ? const Color(0xFFA0A0A0) : const Color(0xFF6B7280),
                ),
              ),
            ),
          )
              : SliverPadding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
            sliver: SliverList.separated(
              itemCount: filteredServices.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final service = filteredServices[index];
                return ServiceCard(
                  service: service,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}