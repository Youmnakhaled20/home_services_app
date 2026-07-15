class ServiceModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final String price;
  final double rating;
  final String duration;

  const ServiceModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rating,
    required this.duration,
  });
}