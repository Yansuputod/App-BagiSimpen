// Model kategori
class CategoryModel {
  final String name;
  final String imageUrl;
  final int itemCount;

  CategoryModel({
    required this.name,
    required this.imageUrl,
    required this.itemCount,
  });
}

final List<CategoryModel> categories = [
  CategoryModel(
      name: "Sembako",
      imageUrl: "assets/images/flashSale/beras.jpeg",
      itemCount: 24),
  CategoryModel(
      name: "Sembako",
      imageUrl: "assets/images/flashSale/beras.jpeg",
      itemCount: 24),
  CategoryModel(
      name: "Sembako",
      imageUrl: "assets/images/flashSale/beras.jpeg",
      itemCount: 24),
];
