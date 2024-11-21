class Meal {
  final String name;
  final int price;
  final String imageUrl;
  final String mealType;
  final String diet;
  final String ingredients;
  final String nutritionInfo;
  final String restaurantName; // New field

  Meal({
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.mealType,
    required this.diet,
    required this.ingredients,
    required this.nutritionInfo,
    required this.restaurantName, // Initialize field
  });

  factory Meal.fromJson(Map<String, dynamic> json, String restaurantName) {
    return Meal(
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
      mealType: json['mealType'],
      diet: json['diet'],
      ingredients: json['ingredients'],
      nutritionInfo: json['nutritionInfo'],
      restaurantName: restaurantName,
    );
  }
}
