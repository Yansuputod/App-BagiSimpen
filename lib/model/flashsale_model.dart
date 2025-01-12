
class FlashSaleModel {
  final String imageUrl;
  final int harga;
  final int stock;

  FlashSaleModel({
    required this.imageUrl,
    required this.harga,
    required this.stock,
  });

  
}

final List<FlashSaleModel> flashSales = [
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 50000, 
        stock: 20),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 45000, 
        stock: 15),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 70000, 
        stock: 10),
  ];