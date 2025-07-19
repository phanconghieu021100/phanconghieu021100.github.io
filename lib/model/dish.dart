class Dish {
  final String id;
  final String name;
  final String description;
  final int price;
  final String? imageUrl;
  final String category;
  final bool isAvailable;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.category,
    required this.isAvailable,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      isAvailable: json['isAvailable'],
    );
  }
}
