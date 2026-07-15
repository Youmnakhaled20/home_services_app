import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../../widgets/category_banner.dart';
import '../../widgets/search_service_field.dart';
import '../../widgets/service_list_card.dart';

class ServiceListingScreen extends StatelessWidget {
  final CategoryModel category;

  const ServiceListingScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F9FB),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: CategoryBanner(
              title: category.title,
              image: category.heroImage,
              servicesCount: category.services.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SearchServiceField(
              onSearch: (query) {
                // TODO: هنضيف الـ Search Functionality بعدين
                print('Searching: $query');
              },
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
              itemCount: category.services.length,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (context, index) {
                final service = category.services[index];
                return ServiceListCard(
                  service: service,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${service.name} selected'),
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 30),
          ),
        ],
      ),
    );
  }
}