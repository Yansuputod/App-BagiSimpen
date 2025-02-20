import 'dart:developer';
import 'package:bagisimpen/core/theme/color.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<String> searchSuggestions = [
    "Beras Pak Simpen",
    "Asbak Pak Bagi",
    "Cilok Ali",
    "Lukisan Arya",
    "Tepung Bagus",
    "Printer Wardana",
    "Dupa Pudja",
  ];

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            decoration: const InputDecoration(
              hintText: "Cari produk...",
              hintStyle: TextStyle(color: AppColors.primaryColor, fontSize: 18),
              prefixIcon: Icon(Icons.search, color: AppColors.primaryColor),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 4),
            ),
            onChanged: (query) {
              log("Query: $query");
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Saran Pencarian",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: searchSuggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(searchSuggestions[index]),
                    leading: Icon(Icons.search, color: Colors.grey[600]),
                    onTap: () {
                      log("Pilih: ${searchSuggestions[index]}");
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
