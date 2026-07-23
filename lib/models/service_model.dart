import 'package:flutter/material.dart';

class ServiceModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
  final double rating;
  final String duration;
  final String subtitle;
  final String about;
  final String specialistName;
  final String specialistTitle;
  final double specialistRating;
  final int reviewsCount;
  final List<String> keyPoints;
  final List<Map<String, String>> included;
  final bool isBestValue;
  final IconData statIcon;
  final String statLabel;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.duration,
    required this.subtitle,
    required this.about,
    required this.specialistName,
    required this.specialistTitle,
    required this.specialistRating,
    required this.reviewsCount,
    required this.keyPoints,
    required this.included,
    required this.statIcon,
    required this.statLabel,
    this.isBestValue = false,
  });
}