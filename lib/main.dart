import 'package:flutter/material.dart';
import 'package:flutter_cocktail/bottom_navigation/bottom_navigation_page.dart';
import 'package:flutter_cocktail/localization/app_localizations_delegate.dart';
import 'package:flutter_cocktail/localization/locale_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const CocktailApp());
}

class CocktailApp extends StatefulWidget {
  const CocktailApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_CocktailAppState>();
    state!.setLocale(newLocale);
  }

  @override
  _CocktailAppState createState() => _CocktailAppState();
}

class _CocktailAppState extends State<CocktailApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    LocaleConstants.getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: const [
        Locale('en', ''),
      ],
      localizationsDelegates: const [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      localeResolutionCallback: _localeResolutionCallback,
      home: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.grey.shade300],
          ),
        ),
        child: const BottomNavigationPage(),
      ),
    );
  }

  Locale? _localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode &&
          supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}
