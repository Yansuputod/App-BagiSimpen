import 'package:bagisimpen/core/theme/color.dart';
import 'package:bagisimpen/core/util/pemisah.dart';
import 'package:bagisimpen/model/jasa_kirim.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatefulWidget {
  final String title;
  final String imageUrl;
  final int price;
  final double rating;
  final int sold;

  const ProductDetail({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.rating,
    required this.sold,
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
      color: AppColors.primaryColor,
      child: Row(
        children: [
          // Tombol pertama
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Logika untuk tombol pertama
              },
              child: Container(
                color: Colors.transparent, // Polos tanpa warna
              ),
            ),
          ),
          // Tombol kedua
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Logika untuk tombol kedua
              },
              child: Container(
                color: Colors.white, // Polos tanpa warna
              ),
            ),
          ),
          // Tombol ketiga
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Logika untuk tombol ketiga
              },
              child: Container(
                color: Colors.white, // Polos tanpa warna
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
}
