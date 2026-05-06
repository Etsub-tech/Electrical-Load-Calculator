import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'screens/calculator_screen.dart';

void main() {
  runApp(const ElectricalLoadApp());
}

class ElectricalLoadApp extends StatefulWidget {
  const ElectricalLoadApp({super.key});

  @override
  State<ElectricalLoadApp> createState() => _ElectricalLoadAppState();
}

class _ElectricalLoadAppState extends State<ElectricalLoadApp> {
  Locale _locale = const Locale('en');

  void toggleLanguage() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('am')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      locale: _locale,

      supportedLocales: const [
        Locale('en'),
        Locale('am'),
      ],

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,

        colorScheme: const ColorScheme.light(
          primary: Color(0xFF800020), // burgundy
          secondary: Color(0xFFB11226),
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
      ),

      home: CalculatorScreen(
        onToggleLanguage: toggleLanguage,
      ),
    );
  }
}