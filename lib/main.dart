import 'package:campusnutrigo/screens/public/main_meal_selection_screen/screen.dart';
import 'package:campusnutrigo/themes/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NutriGo',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme(context),
      home: const MealSelectionScreen(),
    );
  }
}
