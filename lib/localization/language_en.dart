import 'package:flutter_cocktail/localization/languages.dart';

class LanguageEn extends Languages {
  // HomePage
  @override
  String get homePageBoldPartTitle => 'Your';

  @override
  String get homePageNormalPartTitle => 'next Cocktail';

  @override
  String get randomCocktailTitle => 'Random cocktail';

  // SearchPage
  @override
  String get searchPageBoldPartTitle => 'Search';

  @override
  String get searchPageNormalPartTitle => 'next Cocktail';

  // FavoritesPage
  @override
  String get favoritesPageBoldPartTitle => 'Your';

  @override
  String get favoritesPageNormalPartTitle => 'favorites';

  // SettingsPage
  @override
  String get settingsPageBoldPartTitle => 'Set up';

  @override
  String get settingsPageNormalPartTitle => 'your app';
}
