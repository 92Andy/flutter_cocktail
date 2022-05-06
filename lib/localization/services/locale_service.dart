import 'package:flutter/material.dart';
import 'package:flutter_cocktail/main.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class LocaleService {
  LocaleService() {
    initPreferences();
  }

  String prefSelectedLanguageCode = "SelectedLanguageCode";
  late SharedPreferences preferences;

  Future<void> initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<Locale> setLocale(String languageCode) async {
    await preferences.setString(prefSelectedLanguageCode, languageCode);
    return _locale(languageCode);
  }

  Future<Locale> getLocale() async {
    String languageCode =
        preferences.getString(prefSelectedLanguageCode) ?? "en";
    return _locale(languageCode);
  }

  Locale _locale(String languageCode) {
    return languageCode.isNotEmpty
        ? Locale(languageCode, '')
        : const Locale('en', '');
  }

  void changeLanguage(BuildContext context, String selectedLanguageCode) async {
    var _locale = await setLocale(selectedLanguageCode);
    CocktailApp.setLocale(context, _locale);
  }
}
