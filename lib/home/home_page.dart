import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cocktail/home/cubit/home_cubit.dart';
import 'package:flutter_cocktail/home/widgets/cards/big_cocktail_card.dart';
import 'package:flutter_cocktail/home/widgets/home_title.dart';
import 'package:flutter_cocktail/localization/languages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      body: BlocProvider(
        create: (context) => HomeCubit(),
        child: const _HomeView(),
      ),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            SizedBox(height: 120),
            HomeTitle(),
            //SearchBar(), //Todo: search callback should be added
            SizedBox(height: 50),
            RandomCocktail(),
            SizedBox(height: 30),
            RandomCocktail(), //Todo: get and add random cocktail + refresh callback
            SizedBox(height: 30),
            RandomCocktail(),
            SizedBox(height: 100),
          ],
        ),
      ),
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
          children: [
            Text(
              Languages.of(context).randomCocktailTitle,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const IconButton(
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
