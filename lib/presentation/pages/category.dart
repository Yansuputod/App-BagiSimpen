import 'dart:developer';
import 'package:bagisimpen/core/theme/color.dart';
import 'package:bagisimpen/model/category_model.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Category",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: categories.map((category) {
              return GestureDetector(
                onTap: () {
                  // Logika ketika kategori diklik
                  log("Klik kategori: ${category.name}");
                },
                child: Container(
                  height: 120,
                  margin: const EdgeInsets.only(bottom: 12), // Jarak antar item
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 6,
                        offset: const Offset(0, 3), // Shadow ke bawah
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Gambar kategori
                      Container(
                        width: 100,
                        height: 100,
                        margin: const EdgeInsets.only(right: 16),
                        child: Image.asset(
                          category.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 35),
                      // Nama kategori dan jumlah item
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category.name,
                              style: const TextStyle(
                                fontSize: 20, // Ukuran font lebih besar
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "${category.itemCount} items",
                              style: const TextStyle(
                                fontSize: 16, // Ukuran font lebih besar
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 30,
                        child: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
