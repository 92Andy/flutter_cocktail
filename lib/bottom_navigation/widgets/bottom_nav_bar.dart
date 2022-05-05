import 'package:flutter/material.dart';
import 'package:flutter_cocktail/bottom_navigation/widgets/bottom_nav_bar_icon_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.iconTapped,
    required this.currentIndex,
  }) : super(key: key);

  final Function(int) iconTapped;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 1,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 0,
                iconData: Icons.home,
                onTap: iconTapped,
              ),
              BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 1,
                iconData: Icons.search,
                onTap: iconTapped,
              ),
              BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 2,
                iconData: Icons.star_outline,
                onTap: iconTapped,
              ),
              BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 3,
                iconData: Icons.settings,
                onTap: iconTapped,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
