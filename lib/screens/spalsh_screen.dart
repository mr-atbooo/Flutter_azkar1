import 'package:azkar1/screens/category_screen.dart';
import 'package:azkar1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (BuildContext context) => const CategoryScreen(),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              opacity: 0.1,
              image: AssetImage("assets/images/splash_background.jpg",),
              fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/splash.png",
              height: 150,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'أذكار المسلم',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
                color: const Color(0xFF36545e),
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                height: 50.0,
                width: 50.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
