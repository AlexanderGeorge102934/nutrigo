import 'package:flutter/material.dart';
import '../../utils/constant/sizes.dart';
import '../public/main_meal_selection_screen/screen.dart';
import 'set_pickup_time_screen.dart';

class PickupInfoScreen extends StatelessWidget {
  final String mealName;
  final String imageUrl;
  final double price;
  final String location;
  final String pickupTime;
  final int remainingBudget;
  final String dietaryPreference;
  final String mealType;
  final int priceLimit;

  const PickupInfoScreen({
    Key? key,
    required this.mealName,
    required this.imageUrl,
    required this.price,
    required this.location,
    required this.pickupTime,
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
          "Order Confirmed!",
          style: TextStyle(color: Colors.black, fontSize: TSizes.fontSizeXl(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.lg(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Order",
                style: TextStyle(fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.bold),
              ),
              SizedBox(height: TSizes.md(context)),
              Card(
                color: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(TSizes.md(context)),
                  child: Row(
                    children: [
                      Image.asset(
                        imageUrl,
                        width: TSizes.imageThumbSize,
                        height: TSizes.imageThumbSize,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: TSizes.md(context)),
                      Expanded(
                        child: Text(
                          mealName,
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
                    ],
                  ),
                ),
              ),
              SizedBox(height: TSizes.sm(context)),
              Text(
                "Pickup Info",
                style: TextStyle(
                  fontSize: TSizes.fontSizeXl(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
              SizedBox(height: TSizes.sm(context)),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
                ),
                padding: EdgeInsets.all(TSizes.md(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pickup Location",
                      style: TextStyle(fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      location,
                      style: TextStyle(fontSize: TSizes.fontSizeMd(context)),
                    ),
                    Divider(),
                    Text(
                      "Pickup Time",
                      style: TextStyle(fontSize: TSizes.fontSizeLg(context), fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "$pickupTime PM",
                      style: TextStyle(fontSize: TSizes.fontSizeMd(context)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.md(context)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainMealSelectionScreen(
                            remainingBudget: remainingBudget,
                            dietaryPreference: dietaryPreference,
                            mealType: mealType,
                            priceLimit: priceLimit,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: Size(TSizes.buttonWidth(context), TSizes.buttonHeight(context)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                      ),
                    ),
                    child: Text(
                      "Cancel Order",
                      style: TextStyle(fontSize: TSizes.fontSizeLg(context), color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SetPickupTimeScreen(
                            mealName: mealName,
                            imageUrl: imageUrl,
                            price: price,
                            location: location,
                            remainingBudget: remainingBudget,
                            dietaryPreference: dietaryPreference,
                            mealType: mealType,
                            priceLimit: priceLimit,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      minimumSize: Size(TSizes.buttonWidth(context), TSizes.buttonHeight(context)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                      ),
                    ),
                    child: Text(
                      "Modify Time",
                      style: TextStyle(fontSize: TSizes.fontSizeLg(context), color: Colors.white),
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.md(context)),
            ],
          ),
        ),
      ),
    );
  }
}
