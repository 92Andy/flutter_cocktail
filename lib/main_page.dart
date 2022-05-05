import 'package:flutter/material.dart';
import 'package:flutter_cocktail/favorites/favorites_page.dart';
import 'package:flutter_cocktail/home/home_page.dart';
import 'package:flutter_cocktail/search/search_page.dart';
import 'package:flutter_cocktail/settings/settings_page.dart';
import 'package:flutter_cocktail/widgets/background_image.dart';
import 'package:flutter_cocktail/widgets/bottom_nav_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIndex = 0;
  final listOfPages = <Widget>[
    const HomePage(),
    const SearchPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentPageIndex,
        iconTapped: (int index) => setState(() {
          currentPageIndex = index;
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeIn,
          );
        }),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: pageController,
            children: listOfPages,
          ),
        ],
      ),
    );
  }
}
