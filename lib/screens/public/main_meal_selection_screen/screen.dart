import 'package:flutter/material.dart';
import '../../../components/meal_option_card.dart';
import '../../../components/models/meal.dart';
import '../../../services/api_service.dart';
import '../../../utils/constant/sizes.dart';
// Import the extension if placed in a separate file
// import '../../../utils/extensions/string_extensions.dart';

// Extension to capitalize the first letter of a string
extension StringCasingExtension on String {
  String capitalizeFirstLetter() {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

class MainMealSelectionScreen extends StatefulWidget {
  final int remainingBudget;
  final String dietaryPreference;
  final String mealType;
  final int priceLimit;

  const MainMealSelectionScreen({
    super.key,
    required this.remainingBudget,
    required this.dietaryPreference,
    required this.mealType,
    required this.priceLimit,
  });

  @override
  _MainMealSelectionScreenState createState() =>
      _MainMealSelectionScreenState();
}

class _MainMealSelectionScreenState extends State<MainMealSelectionScreen> {
  late Future<List<Meal>> meals;

  @override
  void initState() {
    super.initState();
    meals = ApiService.fetchMenus().then((meals) {
      return meals.where((meal) {
        return meal.diet == widget.dietaryPreference &&
            meal.mealType == widget.mealType &&
            meal.price <= widget.priceLimit;
      }).toList();
    });
  }

  void _showMealDetails(BuildContext context, Meal meal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the sheet to take up the full height if needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(TSizes.borderRadiusLg(context)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(TSizes.md(context)),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                // Meal Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(TSizes.borderRadiusMd(context)),
                  child: Image.network(
                    meal.imageUrl,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Meal Name
                Text(
                  meal.name,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeXXl(context),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: TSizes.sm(context)),

                // Restaurant Name
                Text(
                  'From: ${meal.restaurantName}',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeMd(context),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Price and Diet
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Price: \$${meal.price}',
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd(context),
                      ),
                    ),
                    Text(
                      'Diet: ${meal.diet.capitalizeFirstLetter()}', // Capitalized first letter
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.md(context)),

                // Meal Type
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Meal Type: ${meal.mealType.capitalizeFirstLetter()}', // Capitalized first letter
                    style: TextStyle(
                      fontSize: TSizes.fontSizeMd(context),
                    ),
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Ingredients
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Ingredients:',
                    style: TextStyle(
                      fontSize: TSizes.fontSizeMd(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: TSizes.sm(context)),
                Text(
                  meal.ingredients,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeSm(context),
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Nutrition Info
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Nutrition Info:',
                    style: TextStyle(
                      fontSize: TSizes.fontSizeMd(context),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: TSizes.sm(context)),
                Text(
                  meal.nutritionInfo,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeSm(context),
                  ),
                ),
                SizedBox(height: TSizes.md(context)),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meals Selection")),
      body: FutureBuilder<List<Meal>>(
        future: meals,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final meals = snapshot.data!;
            return Padding(
              padding: EdgeInsets.all(TSizes.sm(context)),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Display 2 cards per row
                  crossAxisSpacing: TSizes.sm(context),
                  mainAxisSpacing: TSizes.sm(context),
                  childAspectRatio: 0.95, // Adjust aspect ratio as needed
                ),
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final meal = meals[index];
                  return MealOptionCard(
                    name: meal.name,
                    imageUrl: meal.imageUrl,
                    price: meal.price,
                    diet: meal.diet,
                    mealType: meal.mealType,
                    restaurantName: meal.restaurantName,
                    onTap: () {
                      _showMealDetails(context, meal);
                    },
                  );
                },
              ),
            );
          } else {
            return const Center(child: Text('No meals available.'));
          }
        },
      ),
    );
  }
}
