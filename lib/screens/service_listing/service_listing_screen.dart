import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../models/service_model.dart';
import 'widgets/ServiceListCardGlass .dart';
import 'widgets/category_banner.dart';
import 'widgets/search_service_field.dart';
import '../service_details/service_details_screen.dart';

class ServiceListingScreen extends StatefulWidget {
  final CategoryModel category;

  const ServiceListingScreen({
    super.key,
    required this.category,
  });

  @override
  State<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  List<ServiceModel> filteredServices = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredServices = widget.category.services;
  }

  void _filterServices(String query) {
    setState(() {
      searchQuery = query;
      if (query.isEmpty) {
        filteredServices = widget.category.services;
      } else {
        filteredServices = widget.category.services
            .where((service) =>
            service.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? Colors.white : Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
        children: [
          if (isDark)
            Image.asset(
              'assets/images/background.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.white,
              ),
            ),
          if (isDark)
            Container(
              color: Colors.black.withOpacity(0.1),
            ),
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: CategoryBanner(
                  title: widget.category.title,
                  image: widget.category.heroImage,
                  servicesCount: filteredServices.length,
                ),
              ),
              SliverToBoxAdapter(
                child: SearchServiceField(
                  onSearch: _filterServices,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverList.separated(
                  itemCount: filteredServices.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final service = filteredServices[index];
                    return ServiceListCardGlass(
                      service: service,
                      index: index,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ServiceDetailsScreen(
                              service: service,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              if (filteredServices.isEmpty)
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Column(
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey,
                        ),
                        SizedBox(height: 16),
                        Text(
                          'No services found',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 30),
              ),
            ],
          ),
        ],
      ),
    );
  }
}