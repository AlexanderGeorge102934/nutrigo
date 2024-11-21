import 'package:flutter/material.dart';
import '../../../utils/constant/sizes.dart';

class MealOptionCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  final String diet;
  final String mealType;
  final String restaurantName; // Added restaurant name
  final VoidCallback onTap;

  const MealOptionCard({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.diet,
    required this.mealType,
    required this.restaurantName, // Added restaurant name
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: TSizes.cardElevation(context),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
        ),
        child: Padding(
          padding: EdgeInsets.all(TSizes.md(context)),
          child: Row(
            children: [
              // Meal Image
              ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusSm(context)),
                child: Image.asset(
                  imageUrl,
                  height: TSizes.imageThumbSize,
                  width: TSizes.imageThumbSize,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: TSizes.sm(context)),
              // Meal Details
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: TSizes.sm(context)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Meal Name
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: TSizes.fontSizeLg(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwItems(context)),
                      // Restaurant Name
                      Text(
                        'From: $restaurantName',
                        style: TextStyle(
                          fontSize: TSizes.fontSizeSm(context),
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwItems(context)),
                      // Diet and Meal Type
                      Text(
                        '$diet | $mealType',
                        style: TextStyle(
                          fontSize: TSizes.fontSizeSm(context),
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: TSizes.spaceBtwItems(context)),
                      // Price
                      Text(
                        '\$${price.toString()}',
                        style: TextStyle(
                          fontSize: TSizes.fontSizeMd(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
