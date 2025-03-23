class ShoeClass {
  final String name;
  final String category;
  final String price;
  final List<String> imagePath;
  final String description;
  final String longDescription;
  final String discount;

  ShoeClass({
    required this.discount,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.description,
    required this.longDescription,
    required this.category,
  });
}
