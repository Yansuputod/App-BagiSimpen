// ignore_for_file: unnecessary_string_escapes

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
        imageUrl: 'assets/images/mainsale/mainsale1.jpeg',
        title: 'Beras Pak Simpen',
        price: 75900,
        sold: 2102,
        rating: 4.5,
        deskripsi: 'Beras Pilihan oleh Pak Simpen dan anaknya Adit. dipilih dari pertanian Ngawi Farm yg sudah legend',
      ),
      MainSaleItem(
        imageUrl: 'assets/images/mainsale/mainsale2.jpeg',
        title: 'Tepung Pak Panca 500g',
        price: 7500,
        sold: 213,
        rating: 4.0,
        deskripsi: 'Tepung oleh Panca dan Anggi',
      ),
      MainSaleItem(
        imageUrl: 'assets/images/mainsale/mainsale3.jpeg',
        title: 'Tepung Bu Yuli 500g',
        price: 6999,
        sold: 202,
        rating: 4.3,
        deskripsi: 'Tepung Yuli',
      ),
      MainSaleItem(
        imageUrl: 'assets/images/mainsale/mainsale4.jpeg',
        title: 'Gelas Bagus',
        price: 3600,
        sold: 2102,
        rating: 4.8,
        deskripsi: 'Gelas yg Bagus',
      ),
      MainSaleItem(
        imageUrl: 'assets/images/mainsale/mainsale5.jpeg',
        title: 'Sabun Cuci Piring Dan Muka',
        price: 3100,
        sold: 2172,
        rating: 3.1,
        deskripsi: 'Sabun Yg Serba Guna',
      ),
        MainSaleItem(
          imageUrl: 'assets/images/mainsale/mainsale6.jpeg',
          title: 'Kopi Arya \"Kopinya Para Arya\"',
          price: 220000,
          sold: 2102,
          rating: 4.0,
          deskripsi: 'Kopi Bangsawan Jaman Penjajahan',
        ),
        MainSaleItem(
          imageUrl: 'assets/images/mainsale/mainsale7.jpeg',
          title: 'Jagung Popcorn 500g',
          price: 10500,
          sold: 331,
          rating: 4.5,
          deskripsi: 'Jagung Buat Popcorn',
        ),
        MainSaleItem(
          imageUrl: 'assets/images/mainsale/mainsale8.jpeg',
          title: 'Gula Bapaknya Jawa',
          price: 16500,
          sold: 210,
          rating: 4.0,
          deskripsi: 'Rasis',
        ),
        MainSaleItem(
          imageUrl: 'assets/images/mainsale/mainsale9.jpeg',
          title: 'Sendok Abad Pertengahan 1 Pack',
          price: 12000,
          sold: 2102,
          rating: 4.0,
          deskripsi: 'Ytta',
        ),
        MainSaleItem(
          imageUrl: 'assets/images/mainsale/mainsale10.jpeg',
          title: 'Susu Khas Ngawi',
          price: 99999999,
          sold: 1,
          rating: 1.0,
          deskripsi: 'Dari Sapi Muani Pilihan',
        ),
];