class UpdateCategoryModel {
  final String id;
  final String name;
  final String image;

  UpdateCategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory UpdateCategoryModel.fromJson(Map<String, dynamic> json) {
    return UpdateCategoryModel(
      id: json['id'].toString(),
      name: json['name'].toString(),
      image: json['image'].toString(),
    );
  }
}
