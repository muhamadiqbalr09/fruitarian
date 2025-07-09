import 'package:flutter/material.dart';
import 'screens/login_page.dart';

void main() {
  runApp(fruitarian());
}

class fruitarian extends StatelessWidget {
  const fruitarian({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => fruitarian(),
      },
    );
  }
}