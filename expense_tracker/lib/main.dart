import 'package:expense_tracker/expense.dart';
import 'package:flutter/material.dart';

var kColorSeed = ColorScheme.fromSeed(seedColor: Colors.deepPurple);
var kDarkColorSeed = ColorScheme.fromSeed(
    seedColor: Colors.deepPurple, brightness: Brightness.dark);
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      //themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorSeed,
        useMaterial3: true,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kColorSeed.onPrimaryContainer,
          foregroundColor: kColorSeed.primaryContainer,
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorSeed.primaryContainer,
              foregroundColor: kColorSeed.onPrimaryContainer),
        ),
      ),
      theme: ThemeData(
        colorScheme: kColorSeed,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorSeed.onPrimaryContainer,
          foregroundColor: kColorSeed.primaryContainer,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kColorSeed.onPrimaryContainer,
          foregroundColor: kColorSeed.primaryContainer,
        ),
        cardTheme: CardTheme(
          color: kColorSeed.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorSeed.primaryContainer,
              foregroundColor: kColorSeed.onPrimaryContainer),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: kColorSeed.onPrimaryContainer,
          ),
        ),
      ),
      home: const Expenses(),
    );
  }
}
