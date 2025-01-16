
class FlashSaleModel {
  final String imageUrl;
  final int harga;
  final int stock;
  final int diskon;

  FlashSaleModel({
    required this.imageUrl,
    required this.harga,
    required this.stock,
    required this.diskon,
  });

  
}

final List<FlashSaleModel> flashSales = [
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 50000, 
        stock: 20,
        diskon: 10,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 45000, 
        stock: 15,
        diskon: 10,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 70000, 
        stock: 10,
        diskon: 10,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/beras.jpeg', 
        harga: 70000, 
        stock: 10,
        diskon: 10,),
  ];