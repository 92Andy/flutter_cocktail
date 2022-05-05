import 'package:flutter/material.dart';

class BottomNavBarIconItem extends StatefulWidget {
  const BottomNavBarIconItem({
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
  State<BottomNavBarIconItem> createState() => _BottomNavBarIconItemState();
}

class _BottomNavBarIconItemState extends State<BottomNavBarIconItem> {
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
