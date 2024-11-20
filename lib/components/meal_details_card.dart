import 'package:flutter/material.dart';
import '../screens/order_flow/order_confirmation_screen.dart';
import '../utils/constant/sizes.dart';

class MealDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String ingredients;
  final String nutritionInfo;
  final double price;
  final int remainingBudget;
  final String dietaryPreference;
  final String mealType;
  final int priceLimit;

  const MealDetailsScreen({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.ingredients,
    required this.nutritionInfo,
    required this.price,
    required this.remainingBudget,
    required this.dietaryPreference,
    required this.mealType,
    required this.priceLimit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        title: Text(
          "Nutritional Details",
          style: TextStyle(color: Colors.black, fontSize: TSizes.fontSizeLg(context)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: TSizes.iconMd(context)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.lg(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                imageUrl,
                height: TSizes.imageThumbSize * 1.5,
                fit: BoxFit.cover,
              ),
              SizedBox(height: TSizes.md(context)),
              Text(
                name,
                style: TextStyle(
                  fontSize: TSizes.fontSizeXXl(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: TSizes.md(context)),
              Text(
                "Ingredients",
                style: TextStyle(
                  fontSize: TSizes.fontSizeLg(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: TSizes.sm(context)),
              Text(
                ingredients,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: TSizes.fontSizeMd(context)),
              ),
              SizedBox(height: TSizes.md(context)),
              Text(
                "Nutrition Facts",
                style: TextStyle(
                  fontSize: TSizes.fontSizeLg(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: TSizes.sm(context)),
              Text(
                nutritionInfo,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: TSizes.fontSizeMd(context)),
              ),
              SizedBox(height: TSizes.md(context)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderConfirmationScreen(
                        mealName: name,
                        imageUrl: imageUrl,
                        price: price,
                        location: 'SCE Inner Circle', // Replace with dynamic location if needed
                        remainingBudget: remainingBudget,
                        dietaryPreference: dietaryPreference,
                        mealType: mealType,
                        priceLimit: priceLimit,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    TSizes.buttonWidth(context),
                    TSizes.buttonHeight(context),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                  ),
                ),
                child: Text(
                  "Order",
                  style: TextStyle(fontSize: TSizes.fontSizeLg(context)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
