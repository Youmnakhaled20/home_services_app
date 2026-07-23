// lib/core/theme/app_text_styles.dart
import 'package:flutter/material.dart';

class AppTextStyles {
  static const String fontFamily = 'AppFont';

  // ==================== Hero ====================
  static TextStyle heroTitle(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.065,
    fontWeight: FontWeight.bold,
  );

  static TextStyle heroSubtitle(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.w400,
  );

  // ==================== Section ====================
  static TextStyle sectionTitle(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.055,
    fontWeight: FontWeight.bold,
  );

  // ==================== Cards ====================
  static TextStyle cardTitle(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.w600,
  );

  static TextStyle cardSubtitle(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.033,
  );

  // ==================== Buttons ====================
  static TextStyle buttonText(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.035,
    fontWeight: FontWeight.w600,
  );

  // ==================== Reviews ====================
  static TextStyle reviewName(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.038,
    fontWeight: FontWeight.w600,
  );

  static TextStyle reviewComment(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.033,
  );

  // ==================== Headings ====================
  static TextStyle headlineLarge(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.08,
    fontWeight: FontWeight.bold,
    height: 1.2,
  );

  static TextStyle headlineMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.07,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle headlineSmall(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.06,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  // ==================== Titles ====================
  static TextStyle titleLarge(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.05,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle titleMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.045,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  static TextStyle titleSmall(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );

  // ==================== Body ====================
  static TextStyle bodyLarge(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static TextStyle bodyMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.035,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static TextStyle bodySmall(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.03,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  // ==================== Labels ====================
  static TextStyle labelLarge(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.035,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextStyle labelMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.03,
    fontWeight: FontWeight.w500,
    height: 1.4,
  );

  static TextStyle labelSmall(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.025,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.5,
  );

  // ==================== Buttons ====================
  static TextStyle buttonLarge(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.04,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.3,
  );

  static TextStyle buttonMedium(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.035,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.3,
  );

  static TextStyle buttonSmall(BuildContext context) => TextStyle(
    fontFamily: fontFamily,
    fontSize: MediaQuery.of(context).size.width * 0.03,
    fontWeight: FontWeight.w600,
    height: 1.2,
    letterSpacing: 0.3,
  );
}