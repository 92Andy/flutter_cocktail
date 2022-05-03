import 'package:flutter/material.dart';
import 'package:flutter_cocktail/home/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey.shade300],
          ),
        ),
        child: const HomePage(),
      ),
    ),
  );
}
