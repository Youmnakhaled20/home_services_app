// lib/features/home/presentation/widgets/hero_section.dart
import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../widgets/custom_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      children: [
        Container(
          height: screenHeight * .32,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              image: AssetImage("assets/images/Hero.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: screenHeight * .32,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isDark ? Colors.black.withOpacity(0.45) : Colors.black.withOpacity(0.20),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: 20,
          left: 16,
          right: 16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Home,\nOur Priority",
                style: AppTextStyles.heroTitle(context).copyWith(
                  color: isDark ? AppColors.darkText : AppColors.lightPrimary,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Book trusted professionals\nfor cleaning repairs,\nmaintenance.",
                style: AppTextStyles.heroSubtitle(context).copyWith(
                  color: isDark ? AppColors.darkNeon : AppColors.lightPrimary,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  CustomButton(
                    text: "Book Service",
                    icon: Icons.bolt,
                    onPressed: () {},
                  ),
                  CustomButton(
                    text: "Explore Services",
                    icon: Icons.category_outlined,
                    isOutlined: true,
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}