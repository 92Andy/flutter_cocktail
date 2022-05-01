import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cocktail/home/cubit/home_cubit.dart';
import 'package:flutter_cocktail/home/widgets/background_image.dart';
import 'package:flutter_cocktail/home/widgets/home_title.dart';
import 'package:flutter_cocktail/home/widgets/search_bar.dart';

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocProvider(
          create: (context) => HomeCubit(),
          child: const _HomeView(),
        ),
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
        const BackgroundImage(),
        Padding(
          padding: const EdgeInsets.only(
            top: 100,
            bottom: 40,
            right: 30,
            left: 30,
          ),
          child: Column(
            children: const [
              HomeTitle(),
              SizedBox(height: 50),
              SearchBar(), //Todo: search callback should be added
              SizedBox(height: 50),
              RandomCocktail(), //Todo: get and add random cocktail + refresh callback
            ],
          ),
        ),
      ],
    );
  }
}

class RandomCocktail extends StatelessWidget {
  const RandomCocktail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Random cocktail',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              onPressed: null, //Todo: refresh cocktail
              icon: Icon(Icons.refresh),
            )
          ],
        ),
        const SizedBox(height: 20),
        const BigCocktailCard(),
      ],
    );
  }
}

class BigCocktailCard extends StatelessWidget {
  const BigCocktailCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: CachedNetworkImage(
        imageUrl:
            'https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg',
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.fill,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        placeholder: (context, url) =>
            const Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error)),
      ),
    );
  }
}
