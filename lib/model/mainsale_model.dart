class MainSaleItem {
  final String imageUrl;
  final String title;
  final int price;
  final int sold;
  final double? rating;

  MainSaleItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.sold,
    required this.rating,
  });

}

 List<MainSaleItem> mainSales = [
  MainSaleItem(
    imageUrl: 'assets/images/flashSale/beras.jpeg',
    title: 'Produk 1',
    price: 100000,
    sold: 2102,
    rating: 4.5,
  ),
  MainSaleItem(
    imageUrl: 'assets/images/flashSale/beras.jpeg',
    title: 'Produk 1',
    price: 100000,
    sold: 2102,
    rating: 4.5,
  ),
  // Tambahkan item lainnya...
];