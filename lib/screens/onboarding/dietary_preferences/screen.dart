import 'package:flutter/material.dart';

import '../../../data/user_data.dart';
import '../../../utils/constant/sizes.dart'; // Import user_data

class DietaryPreferenceScreen extends StatefulWidget {
  final VoidCallback onNext;

  const DietaryPreferenceScreen({required this.onNext, super.key});

  @override
  DietaryPreferenceScreenState createState() => DietaryPreferenceScreenState();
}

class DietaryPreferenceScreenState extends State<DietaryPreferenceScreen> {
  String? selectedPreference;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections(context),
          horizontal: TSizes.lg(context),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "What are your dietary preferences?",
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: TSizes.spaceBtwSections(context)),
              _buildPreferenceChip("high protein", Icons.fitness_center),
              _buildPreferenceChip("vegetarian", Icons.restaurant),
              _buildPreferenceChip("vegan", Icons.spa),
              _buildPreferenceChip("general", Icons.restaurant_menu),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: selectedPreference != null
                      ? () {
                    UserData.dietaryPreference = selectedPreference; // Save to global data
                    widget.onNext();
                  }
                      : null,
                  child: const Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceChip(String label, IconData icon) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems(context)),
      child: ChoiceChip(
        label: Row(
          children: [
            Icon(icon, size: TSizes.iconMd(context)),
            SizedBox(width: TSizes.sm(context)),
            Text(label),
          ],
        ),
        selected: selectedPreference == label,
        onSelected: (bool selected) {
          setState(() {
            selectedPreference = selected ? label : null;
          });
        },
        selectedColor: Theme.of(context).chipTheme.selectedColor,
        labelStyle: Theme.of(context).chipTheme.labelStyle,
        padding: Theme.of(context).chipTheme.padding,
      ),
    );
  }
}