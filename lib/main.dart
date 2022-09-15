import 'package:flutter/material.dart';
import 'package:health/config/theme.dart';
import 'package:health/screen/calories_screen.dart';
import 'package:health/screen/home_screen.dart';
import 'package:health/screen/onboard_screen.dart';

void main() => runApp(const HealthApp());

class HealthApp extends StatelessWidget {
  const HealthApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Health",
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const OnboardScreen(),
      routes: {
        "/home": (context) => const HomeScreen(),
        "/calories": (context) => const CaloriesScreen(),
      },
    );
  }
}
