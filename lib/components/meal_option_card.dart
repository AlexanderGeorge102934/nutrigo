import 'package:flutter/material.dart';
import '../../../utils/constant/sizes.dart';

class MealOptionCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  final String diet;
  final String mealType;
  final String restaurantName;
  final VoidCallback onTap;

  const MealOptionCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.diet,
    required this.mealType,
    required this.restaurantName,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(TSizes.cardRadiusMd(context));

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: TSizes.sm(context),
          vertical: TSizes.xs(context),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
          border: Border.all(
            color: Colors.grey.withOpacity(0.5),
            width: 0.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: TSizes.cardElevation(context),
              offset: Offset(0, TSizes.cardElevation(context) * 0.5),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with price overlay
              Stack(
                children: [
                  // Image
                  Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                  // Price Label
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: TSizes.sm(context),
                        vertical: TSizes.xs(context),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(
                          TSizes.cardRadiusSm(context),
                        ),
                      ),
                      child: Text(
                        '\$${price.toString()}',
                        style: TextStyle(
                          fontSize: TSizes.fontSizeMd(context),
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Content Container
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(TSizes.sm(context)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Meal Name
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd(context),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: TSizes.xs(context)),
                    // Restaurant Name and Diet Icon
                    Row(
                      children: [
                        Icon(
                          dietIcon(diet),
                          size: TSizes.iconSm(context),
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: TSizes.xs(context)),
                        Text(
                          restaurantName,
                          style: TextStyle(
                            fontSize: TSizes.fontSizeSm(context),
                            color: Colors.grey[600],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to get diet icon
  IconData dietIcon(String diet) {
    switch (diet.toLowerCase()) {
      case 'vegan':
        return Icons.spa;
      case 'vegetarian':
        return Icons.restaurant;
      case 'high protein':
        return Icons.fitness_center;
      default:
        return Icons.restaurant_menu;
    }
  }
}
