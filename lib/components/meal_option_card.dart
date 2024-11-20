import 'package:flutter/material.dart';
import '../utils/constant/sizes.dart';

class MealOptionCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int price;
  final VoidCallback onTap;

  const MealOptionCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
        ),
        elevation: TSizes.cardElevation(context),
        child: Padding(
          padding: EdgeInsets.all(TSizes.md(context)),
          child: Row(
            children: [
              Image.asset(
                imageUrl, // Use Image.asset for local images
                width: TSizes.imageThumbSize,
                height: TSizes.imageThumbSize,
                fit: BoxFit.cover,
              ),
              SizedBox(width: TSizes.sm(context)),
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: TSizes.fontSizeLg(context),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                '\$$price',
                style: TextStyle(
                  fontSize: TSizes.fontSizeLg(context),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(Icons.info_outline, size: TSizes.iconMd(context), color: Colors.black54),
            ],
          ),
        ),
      ),
    );
  }
}
