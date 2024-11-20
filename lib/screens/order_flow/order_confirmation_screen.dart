import 'package:campusnutrigo/screens/order_flow/set_pickup_time_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/constant/sizes.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String mealName;
  final String imageUrl;
  final double price;
  final String location;
  final int remainingBudget;
  final String dietaryPreference;
  final String mealType;
  final int priceLimit;

  const OrderConfirmationScreen({
    Key? key,
    required this.mealName,
    required this.imageUrl,
    required this.price,
    required this.location,
    required this.remainingBudget,
    required this.dietaryPreference,
    required this.mealType,
    required this.priceLimit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double tax = price * 0.07;
    final double total = price + tax;

    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        title: Text(
          "My Order",
          style: TextStyle(color: Colors.black, fontSize: TSizes.fontSizeXXl(context)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.lg(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Items",
                style: TextStyle(fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.w600),
              ),
              SizedBox(height: TSizes.md(context)),
              Card(
                color: Colors.grey[300],
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
                      SizedBox(width: TSizes.sm(context)),
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
              SizedBox(height: TSizes.md(context)),
              Container(
                padding: EdgeInsets.all(TSizes.md(context)),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Location: $location", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
                    Divider(),
                    ListTile(
                      title: Text("Subtotal", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
                      trailing: Text("\$${price.toStringAsFixed(2)}", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
                    ),
                    ListTile(
                      title: Text("Tax", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
                      trailing: Text("\$${tax.toStringAsFixed(2)}", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
                    ),
                    ListTile(
                      title: Text("Total", style: TextStyle(fontSize: TSizes.fontSizeXl(context))),
                      trailing: Text("\$${total.toStringAsFixed(2)}", style: TextStyle(fontSize: TSizes.fontSizeXl(context))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.md(context)),
              ElevatedButton(
                onPressed: () {
                  _showPaymentConfirmationDialog(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(TSizes.buttonWidth(context), TSizes.buttonHeight(context)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                  ),
                ),
                child: Text("Checkout", style: TextStyle(fontSize: TSizes.fontSizeLg(context))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPaymentConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
          ),
          child: Padding(
            padding: EdgeInsets.all(TSizes.md(context)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Payment Confirmation",
                  style: TextStyle(fontSize: TSizes.fontSizeXl(context), fontWeight: FontWeight.bold),
                ),
                SizedBox(height: TSizes.md(context)),
                ElevatedButton(
                  onPressed: () {
                    // Handle adding card
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, TSizes.buttonHeight(context)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                    ),
                  ),
                  child: Text("Add Card"),
                ),
                SizedBox(height: TSizes.sm(context)),
                ElevatedButton(
                  onPressed: () {
                    // Handle Apple Pay
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, TSizes.buttonHeight(context)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                    ),
                  ),
                  child: Text("Apple Pay"),
                ),
                SizedBox(height: TSizes.md(context)),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
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
                    backgroundColor: Colors.green,
                    minimumSize: Size(double.infinity, TSizes.buttonHeight(context)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                    ),
                  ),
                  child: Text(
                    "Confirm",
                    style: TextStyle(fontSize: TSizes.fontSizeLg(context), color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
