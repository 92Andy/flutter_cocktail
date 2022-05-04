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

class _BottomNavBarIconItem extends StatefulWidget {
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

  @override
  State<_BottomNavBarIconItem> createState() => _BottomNavBarIconItemState();
}

class _BottomNavBarIconItemState extends State<_BottomNavBarIconItem> {
  bool isActive() => widget.currentActiveIndex == widget.itemIndex;
  double minSize = 30, maxSize = 50;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color:
                isActive() ? Colors.grey.withOpacity(.5) : Colors.transparent,
          ),
          height: isActive() ? maxSize : minSize,
          width: isActive() ? maxSize : minSize,
          duration: const Duration(milliseconds: 250),
          child: Center(
            child: Icon(
              widget.iconData,
              color: isActive() ? Colors.white : Colors.grey,
            ),
          ),
        ),
        SizedBox(
          height: maxSize,
          width: maxSize,
          child: GestureDetector(
            onTap: () => widget.onTap(widget.itemIndex),
          ),
        ),
      ],
    );
  }
}
