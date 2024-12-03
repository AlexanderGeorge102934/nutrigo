// lib/ui/screens/meal_selection_screen/meal_selection_screen.dart

import 'package:flutter/material.dart';
import '../../../components/meal_option_card.dart';
import '../../../components/models/meal.dart';
import '../../../services/api_service.dart';
import '../../../utils/constant/sizes.dart';
import 'package:url_launcher/url_launcher.dart';


// Extension to capitalize the first letter of a string
extension StringCasingExtension on String {
  String capitalizeFirstLetter() {
    if (this.isEmpty) return this;
    return this[0].toUpperCase() + substring(1);
  }
}

class MealSelectionScreen extends StatefulWidget {
  const MealSelectionScreen({Key? key}) : super(key: key);


  @override
  _MealSelectionScreenState createState() => _MealSelectionScreenState();
}

class _MealSelectionScreenState extends State<MealSelectionScreen> {
  String? selectedPreference = 'general';
  int? selectedPrice = 5;
  late Future<List<Meal>> meals;

  @override
  void initState() {
    super.initState();
    fetchMeals();
  }

  void fetchMeals() {
    meals = ApiService.fetchMenus().then((meals) {
      return meals
          .where((meal) {
        return (selectedPreference == 'general' || meal.diet == selectedPreference) &&
            meal.price <= (selectedPrice ?? 5) &&
            meal.mealType == getCurrentMealType();
      })
          .toList()
        ..sort((a, b) => b.price.compareTo(a.price)); // Sorting meals from greatest to lowest price
    });
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

  void _onPreferenceChanged(String? newValue) {
    setState(() {
      selectedPreference = newValue;
      fetchMeals();
    });
  }

  void _onPriceChanged(int? newValue) {
    setState(() {
      selectedPrice = newValue;
      fetchMeals();
    });
  }

  void _showMealDetails(BuildContext context, Meal meal) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(TSizes.borderRadiusLg(context)),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.md(context),
            vertical: TSizes.sm(context),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Center(
                  child: Text(
                    meal.name,
                    style: TextStyle(
                      fontSize: TSizes.fontSizeXXl(context),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: TSizes.sm(context)),

                // Restaurant Name
                Center(
                  child: Text(
                    'From ${meal.restaurantName}',
                    style: TextStyle(
                      fontSize: TSizes.fontSizeMd(context),
                      color: Colors.grey[600],
                    ),
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Divider
                Divider(color: Colors.grey[300], thickness: 1),
                SizedBox(height: TSizes.md(context)),

                // Price and Diet Info
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${meal.price}',
                      style: TextStyle(
                        fontSize: TSizes.fontSizeLg(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: TSizes.md(context)),

                // Meal Type

                // Ingredients Section
                Text(
                  'Ingredients:',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeMd(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: TSizes.xs(context)),
                Text(
                  meal.ingredients,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeSm(context),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Nutrition Info Section
                Text(
                  'Nutrition Info:',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeMd(context),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: TSizes.xs(context)),
                Text(
                  meal.nutritionInfo,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeSm(context),
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: TSizes.md(context)),

                // Elevated Order Button
                ElevatedButton(
                  onPressed: () async {
                    final Uri url = Uri.parse(meal.orderUrl);
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    } else {
                      // Can't launch URL
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not launch ${meal.orderUrl}')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                    minimumSize: Size(double.infinity, TSizes.buttonHeight(context)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                    ),
                  ),
                  child: Text(
                    'Order Now',
                    style: TextStyle(
                      fontSize: TSizes.fontSizeMd(context),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Widget buildDropdowns() {
    return Row(
      children: [
        // Price Dropdown
        Expanded(
          child: DropdownButtonFormField<int>(
            value: selectedPrice,
            decoration: const InputDecoration(
              labelText: 'Price',
              border: OutlineInputBorder(),
            ),
            items: [5, 10, 15, 20].map((int value) {
              return DropdownMenuItem<int>(
                value: value,
                child: Text(
                  '\$$value',
                  style: TextStyle(
                  fontSize: TSizes.fontSizeSm(context), // Set your desired font size here
                  ),
                )
              );
            }).toList(),
            onChanged: _onPriceChanged,
          ),
        ),
        SizedBox(width: TSizes.sm(context)),
        // Dietary Preference Dropdown
        Expanded(
          child: DropdownButtonFormField<String>(
            value: selectedPreference,
            decoration: const InputDecoration(
              labelText: 'Diet',
              border: OutlineInputBorder(),
            ),
            items: ['high protein', 'vegan', 'vegetarian', 'general'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value.capitalizeFirstLetter(),
                  style: TextStyle(
                  fontSize: TSizes.fontSizeSm(context), // Set your desired font size here
                  ),
                ),
              );
            }).toList(),
            onChanged: _onPreferenceChanged,
          ),
        ),
      ],
    );
  }

  Widget buildGrid(List<Meal> meals) {
    return Expanded(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: TSizes.sm(context)),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          mainAxisSpacing: TSizes.sm(context),
          crossAxisSpacing: TSizes.sm(context),
          childAspectRatio: 0.86, // Adjust to control card height
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
            onTap: () => _showMealDetails(context, meal),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mealType = getCurrentMealType();
    return Scaffold(
      appBar: AppBar(
        title: Text('Grab some $mealType'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.sm(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildDropdowns(),
            SizedBox(height: TSizes.sm(context)),
            FutureBuilder<List<Meal>>(
              future: meals,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Expanded(child: Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  return Expanded(child: Center(child: Text('Error: ${snapshot.error}')));
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return buildGrid(snapshot.data!);
                } else {
                  return const Expanded(child: Center(child: Text('No meals available.')));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
