import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:ifood/models/cart_item.dart';
import 'package:ifood/models/food_model.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "Aloha Burger",
      description:
          "A tropical delight with grilled pineapple, teriyaki sauce, and juicy beef.",
      image: "assets/images/burgers/ aloha_burger.jpg",
      price: 9.99,
      category: FoodCategory.burgers,
      addons: [
        Addon(name: "Extra Pineapple", price: 1.49),
        Addon(name: "Teriyaki Sauce", price: 0.99),
        Addon(name: "Bacon", price: 1.99),
      ],
    ),
    Food(
      name: "BBQ Burger",
      description:
          "A smoky BBQ sausage, crispy bacon, and onion rings make this beef burger a savory combination.",
      image: "assets/images/burgers/bbq_burger.jpg",
      price: 10.99,
      category: FoodCategory.burgers,
      addons: [
        Addon(name: "Grilled Onions", price: 0.99),
        Addon(name: "Jalapenos", price: 1.49),
        Addon(name: "Extra BBQ Sauce", price: 1.99),
      ],
    ),
    Food(
      name: "Cheese Burger",
      description:
          "Classic cheeseburger with a perfectly grilled beef patty and melted cheese.",
      image: "assets/images/burgers/cheese_burger.jpg",
      price: 8.99,
      category: FoodCategory.burgers,
      addons: [
        Addon(name: "Cheese", price: 0.99),
        Addon(name: "Lettuce", price: 1.49),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Chicken Burger",
      description:
          "Crispy fried chicken breast topped with lettuce and mayo on a toasted bun.",
      image: "assets/images/burgers/chicken_burger.jpg",
      price: 9.49,
      category: FoodCategory.burgers,
      addons: [
        Addon(name: "Spicy Sauce", price: 1.49),
        Addon(name: "Coleslaw", price: 1.99),
      ],
    ),
    Food(
      name: "Veggie Burger",
      description:
          "A hearty plant-based burger topped with fresh veggies and special sauce.",
      image: "assets/images/burgers/veggie_burger.jpg",
      price: 7.99,
      category: FoodCategory.burgers,
      addons: [
        Addon(name: "Avocado", price: 2.99),
        Addon(name: "Sautéed Mushrooms", price: 1.49),
      ],
    ),

    // Salads
    Food(
      name: "Caesar Salad",
      description:
          "Crisp romaine lettuce tossed in Caesar dressing with croutons and parmesan.",
      image: "assets/images/salads/caesar_salad.jpg",
      price: 6.99,
      category: FoodCategory.salads,
      addons: [
        Addon(name: "Grilled Chicken", price: 3.49),
        Addon(name: "Bacon Bits", price: 1.49),
      ],
    ),
    Food(
      name: "Garden Salad",
      description:
          "A fresh mix of seasonal vegetables served with your choice of dressing.",
      image: "assets/images/salads/garden_salad.jpg",
      price: 5.99,
      category: FoodCategory.salads,
      addons: [
        Addon(name: "Feta Cheese", price: 1.99),
        Addon(name: "Olives", price: 0.99),
      ],
    ),
    Food(
      name: "Hawaiian Salad",
      description: "Tropical flavors with pineapple, ham, and mixed greens.",
      image: "assets/images/salads/hawaiian_salad.jpg",
      price: 7.49,
      category: FoodCategory.salads,
      addons: [
        Addon(name: "Grilled Shrimp", price: 4.49),
        Addon(name: "Avocado", price: 2.99),
      ],
    ),
    Food(
      name: "Italian Salad",
      description:
          "A mix of Italian vegetables with olives, mozzarella, and balsamic dressing.",
      image: "assets/images/salads/italian_salad.jpg",
      price: 6.49,
      category: FoodCategory.salads,
      addons: [
        Addon(name: "Salami", price: 1.99),
        Addon(name: "Pepperoncini", price: 0.99),
      ],
    ),

    // Sides
    Food(
      name: "Fries",
      description: "Crispy golden fries, perfect as a side dish.",
      image: "assets/images/sides/fries.jpg",
      price: 2.99,
      category: FoodCategory.sides,
      addons: [],
    ),
    Food(
      name: "Wings",
      description: "Spicy chicken wings served with blue cheese dressing.",
      image: "assets/images/sides/chicken_wings.jpg",
      price: 8.99,
      category: FoodCategory.sides,
      addons: [
        Addon(name: "Extra Sauce", price: 1.49),
      ],
    ),
    Food(
      name: "Chips",
      description: "Crunchy tortilla chips served with salsa.",
      image: "assets/images/sides/chips.jpg",
      price: 2.49,
      category: FoodCategory.sides,
      addons: [],
    ),

    // Desserts
    Food(
      name: "Apple Pie",
      description: "Classic apple pie with a flaky crust and cinnamon.",
      image: "assets/images/desserts/apple_pie.jpg",
      price: 4.99,
      category: FoodCategory.desserts,
      addons: [
        Addon(name: "Vanilla Ice Cream", price: 1.99),
      ],
    ),
    Food(
      name: "Cheesecake",
      description: "Rich and creamy cheesecake with a graham cracker crust.",
      image: "assets/images/desserts/cheesecake.jpg",
      price: 5.49,
      category: FoodCategory.desserts,
      addons: [
        Addon(name: "Strawberry Sauce", price: 1.49),
      ],
    ),
    Food(
      name: "Chocolate Brownie",
      description:
          "Decadent chocolate brownie served warm with chocolate sauce.",
      image: "assets/images/desserts/chocolate_brownie.jpg",
      price: 4.49,
      category: FoodCategory.desserts,
      addons: [
        Addon(name: "Whipped Cream", price: 0.99),
      ],
    ),

    // Drinks
    Food(
      name: "Coke",
      description: "Classic carbonated soft drink.",
      image: "assets/images/drinks/coke.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      addons: [],
    ),
    Food(
      name: "Soda",
      description: "Refreshing soda in various flavors.",
      image: "assets/images/drinks/soda.jpg",
      price: 1.79,
      category: FoodCategory.drinks,
      addons: [],
    ),
    Food(
      name: "Lemonade",
      description: "Freshly squeezed lemonade, sweet and tangy.",
      image: "assets/images/drinks/lemonade.jpg",
      price: 2.49,
      category: FoodCategory.drinks,
      addons: [
        Addon(name: "Mint", price: 0.99),
      ],
    ),
    Food(
      name: "Orange Juice",
      description: "Freshly squeezed orange juice, served chilled.",
      image: "assets/images/drinks/orange_juice.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      addons: [],
    ),
  ];

  final List<CartItem> _cart = [];

  String _deliveryAddress = "Enter delivery address";

  List<Food> get menu => _menu;

  List<CartItem> get cart => _cart;

  String get deliveryAddress => _deliveryAddress;

  void addToCart(Food food, List<Addon> addOns) {
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons = const ListEquality().equals(item.addOns, addOns);
      return isSameFood && isSameAddons;
    });

    if (cartItem != null) {
      cartItem.quantity++;
    } else {
      _cart.add(CartItem(food: food, addOns: addOns));
    }
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (CartItem cartItem in _cart) {
      double itemPrice = cartItem.food.price;
      for (Addon addon in cartItem.addOns) {
        itemPrice += addon.price;
      }
      totalPrice += itemPrice * cartItem.quantity;
    }
    return totalPrice;
  }

  int getTotalQuantity() {
    int totalQuantity = 0;
    for (CartItem cartItem in _cart) {
      totalQuantity += cartItem.quantity;
    }
    return totalQuantity;
  }

  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

  void updateDeliveryAddress(String address) {
    _deliveryAddress = address;
    notifyListeners();
  }

  String displayCartReceipt() {
    final receipt = StringBuffer();

    // Header
    receipt.writeln("---------------------------------------------------");
    receipt.writeln("                                      RECEIPT");
    receipt.writeln("---------------------------------------------------");

    // Date
    String formattedDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
    receipt.writeln("Date :                $formattedDate");
    receipt.writeln();

    // Menu Header
    receipt.writeln("---------------------------------------------------");
    receipt.writeln("                                      MENU");
    receipt.writeln("---------------------------------------------------");

    // Menu Items
    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name.padRight(30)}${_formatPrice(cartItem.food.price)}");
      if (cartItem.addOns.isNotEmpty) {
        receipt.writeln("  Add-ons : ${_formatAddOns(cartItem.addOns)}");
      }
    }

    // Summary
    receipt.writeln("---------------------------------------------------");
    receipt.writeln("Total Items :                  ${getTotalQuantity()}");
    receipt.writeln(
        "Total Price:                ${_formatPrice(getTotalPrice())}");
    receipt.writeln("---------------------------------------------------");
    receipt.writeln("Delivery Address :                  $_deliveryAddress");
    receipt.writeln("---------------------------------------------------");
    receipt.writeln();
    receipt.writeln("Thank you for your purchase!");

    return receipt.toString();
  }

  String _formatPrice(double price) {
    return "\$${price.toStringAsFixed(2)}";
  }

  String _formatAddOns(List<Addon> addOns) {
    return addOns
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
