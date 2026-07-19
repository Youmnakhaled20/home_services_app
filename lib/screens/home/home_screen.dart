import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_nav.dart';
import 'widgets/hero_section.dart';
import 'widgets/reviews_section.dart';
import 'widgets/categories_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      // ✅ خليها شفافة عشان الصورة تظهر من تحت
      backgroundColor: Colors.transparent,
      extendBody: true, // ✅ الـ Body يتمدد تحت الـ Nav Bar
      body: Container(
        decoration: BoxDecoration(
          color: isDark ? Colors.white : AppColors.background,
          image: isDark
              ? DecorationImage(
            image: const AssetImage('assets/images/background.png'),
            fit: BoxFit.cover,
          )
              : null,
        ),
        child: Stack(
          children: [
            if (isDark)
              Container(
                color: Colors.black.withOpacity(0.05),
              ),
            SafeArea(
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
                  ],
                ),
              ),
            ),
          ],
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