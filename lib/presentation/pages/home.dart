// ignore_for_file: deprecated_member_use

import 'package:bagisimpen/model/flashsale_model.dart';
import 'package:bagisimpen/presentation/pages/search.dart';
import 'package:bagisimpen/presentation/util/qr_scanner.dart';
import 'package:bagisimpen/presentation/util/timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      appBar: searchBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            eMoney(context),
            const SizedBox(height: 10),
            flashSale(flashSales),
          ],
        ),
      ),
    );
  }

  AppBar searchBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(0, 99, 13, 1.0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Search()),
                );
              },
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Icon(Icons.search,
                          color: Color.fromRGBO(0, 99, 13, 1.0)),
                    ),
                    Text(
                      'Search...',
                      style: TextStyle(color: Colors.grey, fontSize: 18),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child:
                          Icon(Icons.camera_alt_outlined, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.message),
            color: Colors.white,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  SizedBox eMoney(BuildContext context) {
    return SizedBox(
      height: 65,
      child: Stack(
        children: [
          Container(
            height: 30,
            color: const Color.fromRGBO(0, 99, 13, 1.0),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: SvgPicture.asset("assets/svg/scan.svg"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QRScanner()),
                      );
                    },
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      width: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/wallet.svg",
                              color: const Color.fromRGBO(0, 99, 13, 1.0),
                              height: 20,
                              width: 15,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                "Rp 100.250",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Saldo Anda",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: VerticalDivider(
                      color: Colors.grey,
                      thickness: 0.5,
                      width: 1,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, top: 8, right: 10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                      ),
                      onPressed: () {},
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 0),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/tarik.svg",
                                  color: const Color.fromRGBO(0, 99, 13, 1.0),
                                  height: 20,
                                  width: 15,
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Text(
                                    "Tarik Tunai",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 0),
                            child: Text(
                              "Gratis",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox flashSale(List<FlashSaleModel> flashSales) {
    return SizedBox(
      height: 220,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: const Row(
                  children: [
                    Icon(Icons.flash_on, color: Colors.green, size: 20),
                    SizedBox(width: 2),
                    Text(
                      "Flash Sale",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(width: 2),
                    Icon(Icons.arrow_forward, color: Colors.red, size: 16),
                    SizedBox(width: 135),
                    CountdownTimer(
                      seconds: 10230,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: flashSales.length,
                itemBuilder: (context, index) {
                  final sale = flashSales[index];
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.red.shade100, width: 1),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          sale.imageUrl,
                          height: 120,
                          width: 100,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            "Rp ${separator(sale.harga)}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            'Stock: ${sale.stock}',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String separator(int? number) {
    if (number == null) {
      return '0';
    }
    return number.toString().replaceAllMapped(
      RegExp(r'\B(?=(\d{3})+(?!\d))'),
      (match) => '.',
    );
  }
}
