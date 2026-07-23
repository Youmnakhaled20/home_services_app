import 'package:flutter/material.dart';
import 'package:home_services_app/features/home/widgets/categories_section.dart';
import 'package:home_services_app/features/home/widgets/hero_section.dart';
import 'package:home_services_app/features/home/widgets/reviews_section.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../../widgets/custom_bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final backgroundColor = isDark
        ? const Color(0xFF0A0A0A)
        : AppColors.lightBackground;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .05,
              vertical: 20,
            ),
            child: const Column(
              children: [
                CustomAppBar(),
                HeroSection(),
                SizedBox(height: 16),
                CategoriesSection(),
                SizedBox(height: 16),
                ReviewsSection(),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}