import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
    required this.iconTapped,
  }) : super(key: key);

  final Function(int) iconTapped;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Container(
        height: 50,
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => iconTapped(0),
                icon: const Icon(Icons.home),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () => iconTapped(1),
                icon: const Icon(Icons.search),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () => iconTapped(1),
                icon: const Icon(Icons.star_outline),
                color: Colors.grey,
              ),
              IconButton(
                onPressed: () => iconTapped(1),
                icon: const Icon(Icons.settings),
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
