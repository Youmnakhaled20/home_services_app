import 'package:flutter/material.dart';
import 'package:home_services_app/screens/service_details/widgets/details_description.dar.dart';

import '../../../models/service_model.dart';
import 'widgets/details_availability.dart';
import 'widgets/details_back_button.dart';
import 'widgets/details_book_button.dart';
import 'widgets/details_drag_indicator.dart';
import 'widgets/details_header.dart';
import 'widgets/details_image.dart';
import 'widgets/details_included.dart';
import 'widgets/details_price.dart';         // ✅
class ServiceDetailsScreen extends StatelessWidget {
  final ServiceModel service;

  const ServiceDetailsScreen({
    super.key,
    required this.service,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF0A2E1F),
      body: Stack(
        children: [
          // ✅ Image
          DetailsImage(service: service),
          // Dark Overlay
          Container(
            color: Colors.black.withOpacity(0.3),
          ),
          // Gradient Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: screenHeight * 0.65,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    const Color(0xFF0A2E1F).withOpacity(0.4),
                    const Color(0xFF0A2E1F).withOpacity(0.8),
                    const Color(0xFF0A2E1F),
                  ],
                  stops: const [0.0, 0.15, 0.4, 0.7],
                ),
              ),
            ),
          ),
          // ✅ White Card
          Positioned(
            bottom: 0,
            right: screenWidth * 0.05,
            left: screenWidth * 0.05,
            child: Container(
              height: screenHeight * 0.58,
              width: screenWidth * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 30,
                    offset: const Offset(0, -10),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const DetailsDragIndicator(),
                      const SizedBox(height: 20),
                      DetailsHeader(service: service),
                      const SizedBox(height: 16),
                      DetailsPrice(service: service),
                      const SizedBox(height: 20),
                      DetailsDescription(service: service),
                      const SizedBox(height: 20),
                      const DetailsIncluded(),
                      const SizedBox(height: 20),
                      const DetailsAvailability(),
                      const SizedBox(height: 20),
                      DetailsBookButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Booking flow coming soon!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ✅ Back Button
          const DetailsBackButton(),
        ],
      ),
    );
  }
}