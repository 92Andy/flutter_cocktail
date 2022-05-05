import 'package:flutter/material.dart';

abstract class Languages {
  static Languages of(BuildContext context) =>
      Localizations.of<Languages>(context, Languages)!;

  // HomePage
  String get homePageBoldPartTitle;
  String get homePageNormalPartTitle;
  String get randomCocktailTitle;

  // SearchPage
  String get searchPageBoldPartTitle;
  String get searchPageNormalPartTitle;

  // FavoritesPage
  String get favoritesPageBoldPartTitle;
  String get favoritesPageNormalPartTitle;

  // SettingsPage
  String get settingsPageBoldPartTitle;
  String get settingsPageNormalPartTitle;
}
