import 'package:bagisimpen/core/theme/color.dart';
import 'package:bagisimpen/core/utils/pemisah.dart';
import 'package:bagisimpen/model/jasa_kirim.dart';
import 'package:bagisimpen/model/rating_model.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int price;
  final double rating;
  final int sold;
  final String deskripsi;

  const ProductDetail({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.sold,
    required this.deskripsi,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Pemisah pemisah = Pemisah();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            displayProduk(context),
            const SizedBox(height: 5),
            pengiriman(),
            const SizedBox(height: 5),
            deskripsi(),
            const SizedBox(height: 5),
            rating(ratings),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: navbar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor, // Menggunakan warna primary
      elevation: 0,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.chat),
          onPressed: () {
            // Logika untuk tombol keranjang
          },
        ),
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.share),
          onPressed: () {
            // Logika untuk tombol notifikasi
          },
        ),
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.more_vert),
          onPressed: () {
            // Logika untuk tombol notifikasi
          },
        ),
      ],
    );
  }

Container navbar() {
  return Container(
    height: 60, // Tinggi Bottom Navigation Bar
    decoration: BoxDecoration(
      color: Colors.white, // Warna latar belakang
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1), // Warna shadow
          blurRadius: 4.0, // Jarak blur shadow
          offset: const Offset(0, 2), // Posisi shadow di atas
        ),
      ],
    ),
    child: Row(
      children: [
        // Tombol Chat dengan background putih dan ikon warna AppColor.primary
        Container(
          width: MediaQuery.of(context).size.width / 4, // Set lebar tombol chat
          color: Colors.white, // Background putih
          child: GestureDetector(
            onTap: () {
              // Logika untuk tombol chat
            },
            child: const Icon(Icons.message, 
            color:  AppColors.primaryColor), // Ikon dengan warna AppColors.primary
          ),
        ),
        
        // Divider antara tombol Chat dan Cart dengan warna gray
        Container(
          height: 30, // Tinggi divider
          width: 1, // Lebar divider
          color: Colors.grey, // Warna divider gray
        ),
        
        // Tombol Cart dengan background putih dan ikon warna AppColor.primary
        Container(
          width: MediaQuery.of(context).size.width / 4, // Set lebar tombol cart
          color: Colors.white, // Background putih
          child: GestureDetector(
            onTap: () {
              // Logika untuk tombol cart
            },
            child: const Icon(Icons.shopping_cart, color: AppColors.primaryColor), // Ikon dengan warna AppColors.primary
          ),
        ),
        
        // Tombol Beli Sekarang dengan background hijau
        Container(
          width: MediaQuery.of(context).size.width / 2 - 1, // Set lebar tombol beli lebih besar
          color: Colors.green, // Background hijau
          child: GestureDetector(
            onTap: () {
              // Logika untuk tombol beli
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: const BoxDecoration(
                color: AppColors.primaryColor, // Background hijau
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Rp${pemisah.separator(widget.price)}", // Harga produk
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Teks putih di atas latar belakang hijau
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Beli Sekarang', // Teks "Beli Sekarang"
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white, // Teks putih
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

  Container displayProduk(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar produk tanpa border dan background warna putih
          Container(
            color: Colors.white, // Set background color to white
            child: Image.asset(
              widget.imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          // Informasi produk
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Rp${pemisah.separator(widget.price)}",
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow[700], size: 16),
                          const SizedBox(width: 4),
                          Text("${widget.rating}",
                              style: const TextStyle(fontSize: 14)),
                          const SizedBox(width: 10),
                          Text("${pemisah.separator(widget.sold)} terjual",
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container pengiriman() {
    return Container(
      color: Colors.white,
      height: 130,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.local_shipping, color: AppColors.primaryColor),
              SizedBox(width: 10),
              Text(
                "Pengiriman",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 5),
          // Scroll horizontal untuk menampilkan jasa kirim
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 80, // Tinggi untuk gambar dan nama jasa kirim
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: jasaKirim.length,
              itemBuilder: (context, index) {
                final jasa = jasaKirim[index];

                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    children: [
                      Container(
                        width: 90,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(jasa.imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        jasa.name,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container deskripsi() {
  return Container(
    color: Colors.white,
    padding: const EdgeInsets.all(16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.info, color: AppColors.primaryColor),
            SizedBox(width: 5),
            Text(
              "Deskripsi",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Container(
          alignment: Alignment.topLeft,
          child: Text(
            widget.deskripsi,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            softWrap: true, // Membungkus teks ke baris berikutnya
            overflow: TextOverflow.visible, // Membiarkan teks tetap terlihat
          ),
        ),
      ],
    ),
  );
}

Container rating(List<RatingModel> ratings) {
  return Container(
    padding: const EdgeInsets.all(16), // Padding untuk kontainer utama
    margin: const EdgeInsets.only(top: 10), // Margin atas untuk spasi
    color: Colors.white, // Warna latar belakang
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(Icons.comment_bank, color: AppColors.primaryColor),
            SizedBox(width: 5),
            Text(
              'Ulasan Pengguna', // Judul untuk daftar rating
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10), // Spasi antara judul dan list ulasan
        // ListView.builder untuk menampilkan daftar rating
        ListView.builder(
          shrinkWrap: true, // Mengatur agar ListView menyesuaikan ukuran konten
          physics: const NeverScrollableScrollPhysics(), // Agar scroll tidak double
          itemCount: ratings.length,
          itemBuilder: (context, index) {
            final rating = ratings[index];
            return Container(
              padding: const EdgeInsets.all(16), // Padding untuk setiap item
              margin: const EdgeInsets.only(bottom: 10), // Spasi antar ulasan
              color: Colors.white, // Warna latar belakang item
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Foto profil dan Nama Pengguna
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Foto profil
                      ClipOval(
                        child: Image.network(
                          rating.userImage, // Gambar profil dari model
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return const SizedBox(
                                width: 40,
                                height: 40,
                                child: Center(child: CircularProgressIndicator()),
                              );
                            }
                          },
                          errorBuilder: (context, error, stackTrace) {
                            return const SizedBox(
                              width: 40,
                              height: 40,
                              child: Icon(Icons.person, size: 40, color: Colors.grey),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: 10), // Spasi antara foto dan teks
                      // Nama pengguna
                      Text(
                        rating.userName, // Nama pengguna dari model
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Spasi antara nama dan rating
                  // Bintang rating
                  Row(
                    children: List.generate(5, (index) {
                      // Bintang rating dari model
                      return Icon(
                        index < rating.rating
                            ? Icons.star
                            : Icons.star_border,
                        size: 16,
                        color: Colors.yellow[700],
                      );
                    }),
                  ),
                  const SizedBox(height: 8), // Spasi antara rating dan komentar
                  // Komentar pengguna
                  Text(
                    rating.comment, // Komentar dari model
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    softWrap: true, // Membungkus teks jika panjang
                    overflow: TextOverflow.visible, // Menampilkan teks tanpa potongan
                  ),
                  const SizedBox(height: 8), // Spasi antara komentar dan divider
                  // Divider untuk pemisah antar ulasan
                  const Divider(
                    color: Colors.grey, // Warna divider
                    thickness: 1, // Ketebalan divider
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}


}
