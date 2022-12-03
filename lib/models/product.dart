class Product {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;
  bool? isFavor;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    this.isFavor = false,
  });
}
