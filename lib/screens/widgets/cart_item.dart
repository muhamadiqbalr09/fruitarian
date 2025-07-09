import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String name;
  final int quantity;
  final String price;
  
  const CartItem({
    required this.name,
    required this.quantity,
    required this.price,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name x$quantity'),
          Text('Rp $price'),
        ],
      ),
    );
  }
}