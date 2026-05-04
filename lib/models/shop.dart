import 'package:ember/models/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    // smoked ribeye
    Food(
      name: "smoked Ribeye",
      imagePath: "assets/smoked-ribeye.png",
      price: "\$21.99",
      rating: "4.8",
      description:
          "Deep, rich, and luxurious—this ribeye is slow-smoked to absolute perfection, locking in juices and layering it with bold, smoky flavor. The seared crust gives way to a tender, melt-in-your-mouth center, making every bite feel like a premium experience.",
    ),
    // bbq wings
    Food(
      name: "BBQ Wings",
      imagePath: "assets/wings.png",
      price: "\$13.99",
      rating: "4.9",
      description:
          "Sticky, glossy, and unapologetically bold—these wings are coated in a rich, smoky barbecue glaze that clings like silk. Each bite delivers a perfect balance of sweetness, heat, and that slow-grilled depth, finished with a subtle char that whispers fire-kissed perfection.",
    ),
    // burger
    Food(
      name: "Ember Burger",
      imagePath: "assets/burger.png",
      price: "\$12.99",
      rating: "4.8",
      description:
          "Juicy, stacked, and impossible to ignore—this burger is layers on layers of flavor. A flame-grilled patty sits between a soft, buttery bun, melting cheese cascading down like liquid gold, with crisp lettuce and bold sauces tying it all together. It’s messy in the most irresistible way.",
    ),

    // fries
    Food(
      name: "Ember Fries",
      imagePath: "assets/fries.jpg",
      price: "\$4.99",
      rating: "4.9",
      description:
          "Golden, crisp, and dangerously addictive—these fries are the kind you “just taste” and suddenly the whole plate is gone. Crunchy on the outside, fluffy on the inside, lightly salted to perfection, they’re the quiet star that steals attention without even trying.",
    ),
  ];

  // customer cart
  List<Food> _cart = [];
  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  // add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove to cart
  void removeFrmCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
