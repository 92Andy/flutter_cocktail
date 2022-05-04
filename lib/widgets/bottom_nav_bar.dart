import 'package:flutter/material.dart';

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
              _BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 0,
                iconData: Icons.home,
                onTap: iconTapped,
              ),
              _BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 1,
                iconData: Icons.search,
                onTap: iconTapped,
              ),
              _BottomNavBarIconItem(
                currentActiveIndex: currentIndex,
                itemIndex: 2,
                iconData: Icons.star_outline,
                onTap: iconTapped,
              ),
              _BottomNavBarIconItem(
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

class _BottomNavBarIconItem extends StatelessWidget {
  const _BottomNavBarIconItem({
    Key? key,
    required this.currentActiveIndex,
    required this.itemIndex,
    required this.iconData,
    required this.onTap,
  }) : super(key: key);

  final int itemIndex;
  final int currentActiveIndex;
  final IconData iconData;
  final Function(int) onTap;

  bool isActive() => currentActiveIndex == itemIndex;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: isActive()
          ? const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            )
          : null,
      color: isActive() ? Colors.grey.withOpacity(.5) : Colors.transparent,
      child: SizedBox(
        height: 50,
        width: 50,
        child: InkWell(
          onTap: () => onTap(itemIndex),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: Icon(
            iconData,
            color: isActive() ? Colors.white : Colors.grey,
          ),
        ),
      ),
    );
  }
}
