import 'package:bagisimpen/core/theme/color.dart';
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

  DateTime? lastPressed;
      
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      _showAdDialog();
    });
  }

  void _showAdDialog() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/iklan/iklan3.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (index != 0) {
          setState(() {
            index = 0;
          });
          return false;
        }

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

          return false;
        }

        return true;
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
                NavigationDestination(
                    icon: Icon(Icons.list), label: "Category"),
                NavigationDestination(
                    icon: Icon(Icons.shopping_cart), label: "Cart"),
                NavigationDestination(
                    icon: Icon(Icons.person), label: "Profile"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
