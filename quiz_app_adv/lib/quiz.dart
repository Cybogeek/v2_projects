import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app_adv/questions_screen.dart';
import 'package:quiz_app_adv/splash.dart';
import 'package:quiz_app_adv/startscreen.dart';

import 'theme/color_schemes.g.dart';
import 'theme/custom_color.g.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  late Widget activescreen;

  void switchscreen() {
    setState(() {
      activescreen = const QuestionScreen();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    activescreen = StartScreen(funct: switchscreen);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        ColorScheme lightScheme;
        ColorScheme darkScheme;

        if (lightDynamic != null && darkDynamic != null) {
          lightScheme = lightDynamic.harmonized();
          lightCustomColors = lightCustomColors.harmonized(lightScheme);

          // Repeat for the dark color scheme.
          darkScheme = darkDynamic.harmonized();
          darkCustomColors = darkCustomColors.harmonized(darkScheme);
        } else {
          // Otherwise, use fallback schemes.
          lightScheme = lightColorScheme;
          darkScheme = darkColorScheme;
        }
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              colorScheme: lightScheme,
              extensions: [lightCustomColors],
              useMaterial3: true,
              outlinedButtonTheme: OutlinedButtonThemeData(
                  style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ))),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkScheme,
            extensions: [darkCustomColors],
          ),
          home: Splash(
            child: activescreen,
          ),
        );
      },
    );
  }
}
