class CreateCategories {
  final String name;
  final String image;
  final String id;
  CreateCategories({
    required this.name,
    required this.image,
    required this.id,
  });

  factory CreateCategories.fromJson(Map<dynamic, String> json) {
    return CreateCategories(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      id: json['id'].toString() ?? '',
    );
  }
}
