import 'package:flutter/material.dart';
import 'package:flutter_cocktail/favorites/favorites_page.dart';
import 'package:flutter_cocktail/search/search_page.dart';
import 'package:flutter_cocktail/settings/settings_page.dart';

import 'widgets/bottom_nav_bar.dart';
import 'home/home_page.dart';
import 'widgets/background_image.dart';

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
        child: const MainPage(),
      ),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  final listOfPages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentPageIndex,
        iconTapped: (int index) => setState(() {
          _currentPageIndex = index;
        }),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          listOfPages.elementAt(_currentPageIndex),
        ],
      ),
    );
  }
}
