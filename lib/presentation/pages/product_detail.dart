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
      bottomNavigationBar: navbar(),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      elevation: 0,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.chat),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          iconSize: 18,
          icon: const Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Container navbar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.message, color: AppColors.primaryColor),
            ),
          ),
          Container(
            height: 30,
            width: 1,
            color: Colors.grey,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 4,
            color: Colors.white,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(Icons.shopping_cart, color: AppColors.primaryColor),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2 - 1,
            color: Colors.green,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                decoration: const BoxDecoration(
                  color: AppColors.primaryColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rp${pemisah.separator(widget.price)}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Beli Sekarang',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
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
          Container(
            color: Colors.white,
            child: Image.asset(
              widget.imageUrl,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
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
          Container(
            padding: const EdgeInsets.only(top: 10),
            height: 80,
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
              softWrap: true,
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }

  Container rating(List<RatingModel> ratings) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.comment_bank, color: AppColors.primaryColor),
              SizedBox(width: 5),
              Text(
                'Ulasan Pengguna',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ratings.length,
            itemBuilder: (context, index) {
              final rating = ratings[index];
              return Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipOval(
                          child: Image.network(
                            rating.userImage,
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
                        const SizedBox(width: 10),
                        Text(
                          rating.userName,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < rating.rating
                              ? Icons.star
                              : Icons.star_border,
                          size: 16,
                          color: Colors.yellow[700],
                        );
                      }),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      rating.comment,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.visible,
                    ),
                    const SizedBox(height: 8),
                    const Divider(
                      color: Colors.grey,
                      thickness: 1,
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
