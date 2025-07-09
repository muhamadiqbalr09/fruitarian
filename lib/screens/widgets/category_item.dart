import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  
  const CategoryItem({super.key, required this.name});
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(Icons.category, size: 30),
        ),
        SizedBox(height: 8),
        Text(name),
      ],
    );
  }
}