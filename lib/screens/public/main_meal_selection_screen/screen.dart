import 'package:flutter/material.dart';
import '../../../components/meal_option_card.dart';
import '../../../components/models/meal.dart';
import '../../../services/api_service.dart';

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
  _MainMealSelectionScreenState createState() => _MainMealSelectionScreenState();
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
            return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                final meal = meals[index];
                return MealOptionCard(
                  name: meal.name,
                  imageUrl: meal.imageUrl,
                  price: meal.price,
                  diet: meal.diet,
                  mealType: meal.mealType,
                  restaurantName: meal.restaurantName, // Pass restaurant name
                  onTap: () {
                    // Navigate to meal details or show a dialog
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(meal.name),
                          content: Text(
                            'From: ${meal.restaurantName}\nPrice: \$${meal.price}\nDiet: ${meal.diet}\nMeal Type: ${meal.mealType}\nIngredients: ${meal.ingredients}\nNutrition Info: ${meal.nutritionInfo}',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Close'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No meals available.'));
          }
        },
      ),
    );
  }
}
