import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'screens/home_page.dart';
import 'screens/register_page.dart';
import 'auth_wrapper.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  debugPrint('Initializing Supabase...');
  
  await Supabase.initialize(
    url: 'https://nkwkqljxxnjozxgqoaks.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5rd2txbGp4eG5qb3p4Z3FvYWtzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTIwNjc1MTQsImV4cCI6MjA2NzY0MzUxNH0.XGf6MhW9Ts0JijT2PX4SyWzJ4-mMMzCwlwEA7U6f4Ao',
  );
  
  debugPrint('Supabase initialized successfully');
  debugPrint('Starting app...');
  
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
      home: const AuthWrapper(),
      routes: {
        '/home': (context) => HomePage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}
