class Product {
  final String id;
  final String name;
  final String description;
  final double price;

  final int reviewCount;
  final String imageUrl;
  final DateTime createdAt;

  final Category category;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.category,
      required this.price,
      required this.reviewCount,
      required this.imageUrl,
      required this.createdAt});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      category: Category.fromJson(json['category']),
      reviewCount: json['_count']['Review'],
      imageUrl: json['imageUrl'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
    );
  }
}
