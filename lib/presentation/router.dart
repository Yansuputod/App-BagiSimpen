// ignore_for_file: deprecated_member_use

import 'package:bagisimpen/presentation/pages/cart.dart';
import 'package:bagisimpen/presentation/pages/category.dart';
import 'package:bagisimpen/presentation/pages/home.dart';
import 'package:bagisimpen/presentation/pages/profile.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({super.key});

  @override
  RouteState createState() => RouteState();
}

class RouteState extends State<Routes> {
  int index = 0;
  final screens = [
    const Home(),
    const Category(),
    const Cart(),
    const Profile(),
  ];

  DateTime? lastPressed; // Variabel untuk melacak waktu tombol back terakhir ditekan

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        const duration = Duration(seconds: 2);

        if (lastPressed == null || now.difference(lastPressed!) > duration) {
          lastPressed = now;

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Tekan sekali lagi untuk keluar",
                textAlign: TextAlign.center,
              ),
              duration: Duration(milliseconds: 2000),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          );

          return false; // Jangan keluar jika tombol back hanya ditekan sekali
        }

        return true; // Keluar jika tombol back ditekan dua kali dalam 2 detik
      },
      child: Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.green.shade400,
            backgroundColor: Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            labelTextStyle: WidgetStateProperty.all(
              const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          child: Container(
            height: 65,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: NavigationBar(
              selectedIndex: index,
              onDestinationSelected: (index) => setState(() {
                this.index = index;
              }),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: "Home"),
                NavigationDestination(icon: Icon(Icons.list), label: "Category"),
                NavigationDestination(icon: Icon(Icons.shopping_cart), label: "Cart"),
                NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
