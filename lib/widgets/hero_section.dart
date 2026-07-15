import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_text_styles.dart';

import '../core/theme/app_colors.dart';
import 'custom_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
            color: Colors.black.withOpacity(.15),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
          top: 20,
          left: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Home,\nOur Priority",
                style: AppTextStyles.heroTitle.copyWith(
                  fontSize: screenWidth * .065,
                )
              ),
              const SizedBox(height: 10),
              Text(
                "Book trusted professionals\nfor cleaning repairs,\nmaintenance.",
                style: TextStyle(  color: AppColors.primary,
                  fontSize: screenWidth * .04,
                ),
              ),
              const SizedBox(height: 30),
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