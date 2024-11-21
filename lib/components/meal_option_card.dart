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
    super.key,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.diet,
    required this.mealType,
    required this.restaurantName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: TSizes.md(context), // Compact card width
        margin: EdgeInsets.symmetric(
          horizontal: TSizes.sm(context),
          vertical: TSizes.xs(context) * 0.8,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevent stretching
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Image with Shadow
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(TSizes.sm(context)),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        imageUrl,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: TSizes.lg(context)),
                Text(
                  '\$${price.toString()}',
                  style: TextStyle(
                    fontSize: TSizes.fontSizeXXl(context),
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm(context)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      name,
                      style: TextStyle(
                        fontSize: TSizes.fontSizeMd(context),
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      // Ensure only one line is displayed
                      overflow: TextOverflow.ellipsis,
                      // Add ellipsis if text is too long
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: TSizes.xs(context)),
                  Center(
                    child: Text(
                      restaurantName,
                      style: TextStyle(
                        fontSize: TSizes.fontSizeSm(context),
                        color: Colors.grey[600],
                      ),
                      maxLines: 1, // Ensure only one line is displayed
                      overflow: TextOverflow
                          .ellipsis, // Add ellipsis if text is too long
                    ),
                  ),
                  SizedBox(height: TSizes.xs(context)),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Order",
                        style: TextStyle(fontSize: TSizes.fontSizeSm(context)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}