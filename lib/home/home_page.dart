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
              SearchBar(),
            ],
          ),
        ),
      ],
    );
  }
}
