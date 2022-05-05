import 'package:flutter/material.dart';
import 'package:flutter_cocktail/localization/languages.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            Languages.of(context).homePageBoldPartTitle,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            Languages.of(context).homePageNormalPartTitle,
            style: const TextStyle(fontSize: 25),
          ),
        ),
      ],
    );
  }
}
