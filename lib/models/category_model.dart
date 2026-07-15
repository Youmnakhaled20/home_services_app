import 'service_model.dart';

class CategoryModel {
  final String title;
  final String heroImage;
  final List<ServiceModel> services;

  const CategoryModel({
    required this.title,
    required this.heroImage,
    required this.services,
  });
}