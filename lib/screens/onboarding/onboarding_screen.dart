import 'package:campusnutrigo/screens/onboarding/weekly_budget/screen.dart';
import 'package:flutter/material.dart';
import 'welcome_screen.dart';
import 'information_screen.dart';
import 'dietary_preferences/screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          WelcomeScreen(onNext: nextPage),
          // InformationScreen(onNext: nextPage),
          DietaryPreferenceScreen(onNext: nextPage), // Pass nextPage callback
          const WeeklyBudgetScreen(), // Add WeeklyBudgetScreen as the next screen
        ],
      ),
    );
  }
}
