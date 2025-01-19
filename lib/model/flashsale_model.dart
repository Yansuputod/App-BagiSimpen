
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
        imageUrl: 'assets/images/flashSale/flashsale1.jpeg', 
        harga: 75000, 
        stock: 20,
        diskon: 15,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/flashsale2.jpeg', 
        harga: 51900, 
        stock: 34,
        diskon: 5,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/flashsale3.jpeg', 
        harga: 12300, 
        stock: 142,
        diskon: 10,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/flashsale4.jpeg', 
        harga: 26900, 
        stock: 46,
        diskon: 15,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/flashsale5.jpeg', 
        harga: 1300, 
        stock: 198,
        diskon: 10,),
    FlashSaleModel(
        imageUrl: 'assets/images/flashSale/flashsale6.jpeg', 
        harga: 175000, 
        stock: 20,
        diskon: 10,),
    
  ];