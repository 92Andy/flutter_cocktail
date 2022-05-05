import 'package:flutter/material.dart';
import 'package:flutter_cocktail/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Todo: convert to a services and inject via GetIt
class LocaleConstants {
  static String prefSelectedLanguageCode = "SelectedLanguageCode";

  static Future<Locale> setLocale(String languageCode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(prefSelectedLanguageCode, languageCode);
    return _locale(languageCode);
  }

  static Future<Locale> getLocale() async {
    final preferences = await SharedPreferences.getInstance();
    String languageCode =
        preferences.getString(prefSelectedLanguageCode) ?? "en";
    return _locale(languageCode);
  }

  static Locale _locale(String languageCode) {
    return languageCode.isNotEmpty
        ? Locale(languageCode, '')
        : const Locale('en', '');
  }

  static void changeLanguage(
      BuildContext context, String selectedLanguageCode) async {
    var _locale = await setLocale(selectedLanguageCode);
    CocktailApp.setLocale(context, _locale);
  }
}
