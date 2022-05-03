import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: const [
          SizedBox(height: 120),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Your',
              style: TextStyle(fontSize: 25),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'favorites',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
