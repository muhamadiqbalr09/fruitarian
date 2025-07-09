import 'package:flutter/material.dart';
import 'package:fruitarian/services/auth_service.dart';
import 'package:get/get.dart';
import 'widgets/category_item.dart';
import 'widgets/product_item.dart';
import 'widgets/cart_item.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fruitarian'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              try {
                await _authService.logout();
                Get.snackbar(
                  'Success',
                  'Logged out successfully!',
                  backgroundColor: Colors.green,
                  colorText: Colors.white,
                );
                // AuthWrapper will automatically handle navigation to login
              } catch (e) {
                Get.snackbar(
                  'Error',
                  'Failed to logout: ${e.toString()}',
                  backgroundColor: Colors.red,
                  colorText: Colors.white,
                );
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Product
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search Product',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              
              // Promotion Banner
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  'Happy 25% OFF',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800],
                  ),
                ),
              ),
              SizedBox(height: 20),
              
              // Categories
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  CategoryItem(name: 'Vegetables'),
                  
                  CategoryItem(name: 'Fruits'),
                ],
              ),
              SizedBox(height: 30),
              
              // Products
              ProductItem(
                name: 'Strawberries',
                price: '25.000',
                quantity: 2,
                image: Icons.emoji_food_beverage,
              ),
              ProductItem(
                name: 'Fried Chips',
                price: '15.000',
                quantity: 1,
                image: Icons.fastfood,
              ),
              ProductItem(
                name: 'Fried Chips',
                price: '15.000',
                quantity: 1,
                image: Icons.fastfood,
              ),
              
              // Cart Summary
              SizedBox(height: 30),
              Divider(thickness: 2),
              SizedBox(height: 10),
              
              CartItem(name: 'Strawberries', quantity: 2, price: '50.000'),
              CartItem(name: 'Fried Chips', quantity: 5, price: '75.000'),
              
              SizedBox(height: 20),
              Divider(thickness: 2),
              SizedBox(height: 10),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total All Item:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Rp. 500.000,00',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Checkout'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}