import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      body: _SearchView(),
    );
  }
}

class _SearchView extends StatelessWidget {
  const _SearchView({Key? key}) : super(key: key);

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
              'Search',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'next Cocktail',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
