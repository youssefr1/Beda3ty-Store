class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"] as int? ?? 0,
      name: json["name"] as String? ?? "",
      image: json["image"] as String? ?? "",
    );
  }

  final int id;
  final String name;
  final String image;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
    };
  }
}

class ProductModel {
  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as int? ?? 0,
      title: json["title"] as String? ?? "",
      price: json["price"] as num? ?? 0,
      description: json["description"] as String? ?? "",
      category: CategoryModel.fromJson(
        json["category"] as Map<String, dynamic>? ?? {},
      ),
      images: (json["images"] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  final int id;
  final String title;
  final num price;
  final String description;
  final CategoryModel category;
  final List<String> images;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "price": price,
      "description": description,
      "category": category.toJson(),
      "images": images,
    };
  }
}
