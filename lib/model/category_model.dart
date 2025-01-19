
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
      imageUrl: "assets/images/kategori/sembako.jpeg",
      itemCount: 1004),
  CategoryModel(
      name: "Alat Dapur",
      imageUrl: "assets/images/kategori/alatdapur.jpeg",
      itemCount: 234),
  CategoryModel(
      name: "Elektronik",
      imageUrl: "assets/images/kategori/elektronik.jpeg",
      itemCount: 24),
  CategoryModel(
      name: "pertanian",
      imageUrl: "assets/images/kategori/pertanian.jpeg",
      itemCount: 214),
  CategoryModel(
      name: "otomotif",
      imageUrl: "assets/images/kategori/otomotif.jpeg",
      itemCount: 24),
];
