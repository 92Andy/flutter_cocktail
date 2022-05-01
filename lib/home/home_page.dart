import 'package:flutter/material.dart';
import 'package:flutter_cocktail/shared/glass_morphism.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey.shade300],
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundImage(),
        Padding(
          padding: const EdgeInsets.only(
            top: 55,
            bottom: 40,
            right: 30,
            left: 30,
          ),
          child: Column(
            children: const [
              _Title(),
              SizedBox(height: 40),
              _SearchBar(),
            ],
          ),
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GlassMorphism(
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            hintText: 'Search...',
            hintStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Your',
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
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topRight,
      child: Image(
        height: 300,
        image: AssetImage('assets/palm_tree.png'),
      ),
    );
  }
}
