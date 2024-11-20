import 'package:flutter/material.dart';
import '../../../data/user_data.dart';
import '../../../utils/constant/sizes.dart';
import '../main_meal_selection_screen/screen.dart';

class MealPriceSelection extends StatefulWidget {
  final int initialBudget;

  const MealPriceSelection({super.key, required this.initialBudget});

  @override
  MealPriceSelectionState createState() => MealPriceSelectionState();
}

class MealPriceSelectionState extends State<MealPriceSelection> {
  late int remainingBudget;
  int? selectedAmount;

  @override
  void initState() {
    super.initState();
    remainingBudget = widget.initialBudget;
  }

  // Function to determine the meal type based on the current time
  String getCurrentMealType() {
    final hour = DateTime.now().hour;
    if (hour >= 6 && hour < 11) {
      return "breakfast";
    } else if (hour >= 11 && hour < 16) {
      return "lunch";
    } else if (hour >= 16 && hour < 22) {
      return "dinner";
    } else {
      return "dinner"; // Default to dinner for late-night selections
    }
  }

  void _selectAmount(int amount) {
    setState(() {
      selectedAmount = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections(context),
          horizontal: TSizes.lg(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Select price range of meal",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: TSizes.md(context)),
            Text(
              "Remaining budget for this week: \$$remainingBudget",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            _buildPriceButton(context, 5, "\$"),
            _buildPriceButton(context, 10, "\$\$"),
            _buildPriceButton(context, 15, "\$\$\$"),
            _buildPriceButton(context, 20, "\$\$\$\$"),
            SizedBox(height: TSizes.spaceBtwSections(context)),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: selectedAmount != null
                    ? () {
                  // Determine the meal type based on the current time
                  final mealType = getCurrentMealType();

                  // Navigate to MainMealSelectionScreen and pass the necessary parameters
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainMealSelectionScreen(
                        remainingBudget: remainingBudget,
                        dietaryPreference: UserData.dietaryPreference!,
                        mealType: mealType,
                        priceLimit: selectedAmount!,
                      ),
                    ),
                  );
                }
                    : null,
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceButton(BuildContext context, int amount, String symbol) {
    final isSelected = selectedAmount == amount;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
          padding: EdgeInsets.symmetric(horizontal: TSizes.md(context)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.borderRadiusMd(context)),
          ),
        ),
        onPressed: () => _selectAmount(amount),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              symbol,
              style: TextStyle(
                fontSize: TSizes.fontSizeLg(context),
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            Text(
              "\$$amount",
              style: TextStyle(
                fontSize: TSizes.fontSizeLg(context),
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
