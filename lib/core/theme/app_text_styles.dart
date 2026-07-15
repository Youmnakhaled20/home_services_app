import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const heroTitle = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const heroSubtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.primary,
  );

  static const sectionTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const cardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const cardSubtitle = TextStyle(
    fontSize: 13,
    color: AppColors.white,
  );

  static const buttonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const reviewName = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );

  static const reviewComment = TextStyle(
    fontSize: 13,
    color: AppColors.grey,
  );
}