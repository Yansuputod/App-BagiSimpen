class MainSaleItem {
  final String imageUrl;
  final String title;
  final int price;
  final int sold;
  final double? rating;
  final String deskripsi;

  MainSaleItem({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.sold,
    required this.rating,
    required this.deskripsi,
  });

}

 List<MainSaleItem> mainSales = [
  MainSaleItem(
    imageUrl: 'assets/images/flashSale/beras.jpeg',
    title: 'Produk 1',
    price: 220000,
    sold: 2102,
    rating: 4.0,
    deskripsi: 'Deskripsi Produk 1',
  ),
  MainSaleItem(
    imageUrl: 'assets/images/flashSale/beras.jpeg',
    title: 'Produk 2',
    price: 100000,
    sold: 2012,
    rating: 4.5,
    deskripsi: 'Deskripsi Produk 1sjabdadaisdiahsidhahdahdaishdiaodhioahdioahsdihaidhaishdiosahdoahsdoashdiahsdioahdioahdioashdioashdioahdioahdioahdioa',
  ),
  // Tambahkan item lainnya...
];