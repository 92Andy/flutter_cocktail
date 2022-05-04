import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
              'Set up',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              'your app',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
