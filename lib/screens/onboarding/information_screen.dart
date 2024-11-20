import 'package:flutter/material.dart';

class InformationScreen extends StatelessWidget {
  final VoidCallback onNext;

  InformationScreen({required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300], // Set background color to green
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding around content
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Some Important Information",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20), // Space between text and image
              Image.asset(
                'lib/data/images/info.jpg', // Path to the image
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20), // Space between image and button
              ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
