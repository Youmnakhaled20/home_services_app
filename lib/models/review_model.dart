class ReviewModel {
  final String id;
  final String serviceId; // ✅ يربط الريفيو بالخدمة اللي بيتكلم عنها
  final String image;
  final String name;
  final double rating;
  final String comment;

  ReviewModel({
    required this.id,
    required this.serviceId,
    required this.image,
    required this.name,
    required this.rating,
    required this.comment,
  });
}