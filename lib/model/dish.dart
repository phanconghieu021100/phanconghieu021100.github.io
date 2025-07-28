class Dish {
  final String id;
  final String name;
  final String description;
  final int price;
  final List<String>? imageUrls;
  final String category;
  final bool isAvailable;

  Dish({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrls,
    required this.category,
    required this.isAvailable,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      imageUrls: (json['imageUrls'] as List?)
          ?.map((e) => e.toString())
          .toList(), // safe casting
      category: json['category'],
      isAvailable: json['isAvailable'],
    );
  }
}
