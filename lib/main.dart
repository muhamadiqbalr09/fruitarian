import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screens/login_page.dart';
import 'screens/home_page.dart';

void main() {
  runApp(FruitarianApp());
}

class FruitarianApp extends StatelessWidget {
  const FruitarianApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}