import 'package:ifood/models/food_model.dart';

class CartItem {
  Food food;
  List<Addon> addOns;
  int quantity;

  CartItem({
    required this.food,
    required this.addOns,
    this.quantity = 1,
  });

  double get totalPrice {
    double addOnsPrice = addOns.fold(
      0,
      (sum, addon) => sum + addon.price,
    );
    return (food.price + addOnsPrice) * quantity;
  }
}
