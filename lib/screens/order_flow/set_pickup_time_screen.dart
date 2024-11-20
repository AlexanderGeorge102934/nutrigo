import 'package:campusnutrigo/screens/order_flow/pickup_info_screen.dart';
import 'package:flutter/material.dart';
import '../../utils/constant/sizes.dart';

class SetPickupTimeScreen extends StatefulWidget {
  final String mealName;
  final String imageUrl;
  final double price;
  final String location;
  final int remainingBudget;
  final String dietaryPreference;
  final String mealType;
  final int priceLimit;

  const SetPickupTimeScreen({
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
  _SetPickupTimeScreenState createState() => _SetPickupTimeScreenState();
}

class _SetPickupTimeScreenState extends State<SetPickupTimeScreen> {
  int _hour = 3;
  int _minute = 0;

  void _incrementTime() {
    setState(() {
      _minute += 15;
      if (_minute >= 60) {
        _minute = 0;
        _hour++;
      }
      if (_hour > 12) _hour = 1; // Loop back after 12
    });
  }

  void _decrementTime() {
    setState(() {
      _minute -= 15;
      if (_minute < 0) {
        _minute = 45;
        _hour--;
      }
      if (_hour < 1) _hour = 12; // Loop back before 1
    });
  }

  String _formattedTime() {
    final formattedMinute = _minute.toString().padLeft(2, '0');
    return "$_hour:$formattedMinute";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation: 0,
        title: Text(
          "Set Pickup Time",
          style: TextStyle(color: Colors.black, fontSize: TSizes.fontSizeXl(context)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.lg(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Select Pickup Time",
                style: TextStyle(
                  fontSize: TSizes.fontSizeXl(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.md(context)),
              Container(
                width: TSizes.buttonWidth(context) * 1.5,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(TSizes.cardRadiusMd(context)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                padding: EdgeInsets.symmetric(vertical: TSizes.md(context), horizontal: TSizes.lg(context)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_upward, size: TSizes.iconLg(context)),
                      onPressed: _incrementTime,
                    ),
                    Text(
                      _formattedTime(),
                      style: TextStyle(
                        fontSize: TSizes.fontSizeXXl(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_downward, size: TSizes.iconLg(context)),
                      onPressed: _decrementTime,
                    ),
                  ],
                ),
              ),
              SizedBox(height: TSizes.md(context)),
              Image.asset(
                'lib/data/images/clock.jpg',
                height: TSizes.imageThumbSize * 2,
                fit: BoxFit.cover,
              ),
              SizedBox(height: TSizes.md(context)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PickupInfoScreen(
                        mealName: widget.mealName,
                        imageUrl: widget.imageUrl,
                        price: widget.price,
                        location: widget.location,
                        pickupTime: _formattedTime(),
                        remainingBudget: widget.remainingBudget,
                        dietaryPreference: widget.dietaryPreference,
                        mealType: widget.mealType,
                        priceLimit: widget.priceLimit,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  minimumSize: Size(TSizes.buttonWidth(context), TSizes.buttonHeight(context) * 1.2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(TSizes.buttonRadius(context)),
                  ),
                ),
                child: Text(
                  "Confirm",
                  style: TextStyle(fontSize: TSizes.fontSizeLg(context), color: Colors.white),
                ),
              ),
              SizedBox(height: TSizes.md(context)),
            ],
          ),
        ),
      ),
    );
  }
}
