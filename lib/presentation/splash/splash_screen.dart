import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bagisimpen/presentation/router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/logo/11.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: AnimatedSplashScreen(
              splash: "assets/logo/Animasi_logo.gif",
              splashIconSize: 150,
              centered: true,
              nextScreen: const Routes(),
              duration: 3000,
              backgroundColor: Colors.transparent,
              splashTransition: SplashTransition.fadeTransition,
              pageTransitionType: PageTransitionType.rightToLeft,
            ),
          ),
        ],
      ),
    );
  }
}
