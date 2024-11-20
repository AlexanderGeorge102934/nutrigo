import 'package:flutter/material.dart';

import '../../../data/user_data.dart'; // Import user_data
import '../../../utils/constant/sizes.dart';
import '../../public/meal_price_range_selection/screen.dart';

class WeeklyBudgetScreen extends StatefulWidget {
  const WeeklyBudgetScreen({super.key});

  @override
  WeeklyBudgetScreenState createState() => WeeklyBudgetScreenState();
}

class WeeklyBudgetScreenState extends State<WeeklyBudgetScreen> {
  final TextEditingController _budgetController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _budgetController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _budgetController.removeListener(_updateButtonState);
    _budgetController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _budgetController.text.isNotEmpty;
    });
  }

  void _submitBudget() {
    // Parse the budget input as an integer
    final int budget = int.tryParse(_budgetController.text) ?? 0;
    UserData.weeklyBudget = budget; // Save the budget globally

    // Navigate to MealPriceSelection screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MealPriceSelection(initialBudget: budget),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections(context),
          horizontal: TSizes.lg(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "What is your weekly budget?",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: TSizes.md(context)),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(TSizes.borderRadiusMd(context)),
              ),
              child: TextField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixText: '\$',
                  hintText: "Enter your budget",
                ),
                style: TextStyle(
                  fontSize: TSizes.fontSizeXXl(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            ElevatedButton(
              onPressed: _isButtonEnabled ? _submitBudget : null,
              child: const Text("Continue"),
            ),
          ],
        ),
      ),
    );
  }
}
