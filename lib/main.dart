import 'package:azkar1/screens/home_screen.dart';
import 'package:azkar1/screens/spalsh_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "أذكار المسلم",
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          // color: Colors.green,
          color: const Color(0xFF36545e),
          centerTitle: true,
          elevation: 0,
          titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'),
        ),
      ),
      home: SplashScreen(),
      // home: HomeScreen(),
    );
  }
}
