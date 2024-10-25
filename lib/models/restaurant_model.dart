import 'package:flutter/material.dart';
import 'package:ifood/models/food_model.dart';

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
        Addoon(name: "Extra Pineapple", price: 1.49),
        Addoon(name: "Teriyaki Sauce", price: 0.99),
        Addoon(name: "Bacon", price: 1.99),
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
        Addoon(name: "Grilled Onions", price: 0.99),
        Addoon(name: "Jalapenos", price: 1.49),
        Addoon(name: "Extra BBQ Sauce", price: 1.99),
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
        Addoon(name: "Cheese", price: 0.99),
        Addoon(name: "Lettuce", price: 1.49),
        Addoon(name: "Avocado", price: 2.99),
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
        Addoon(name: "Spicy Sauce", price: 1.49),
        Addoon(name: "Coleslaw", price: 1.99),
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
        Addoon(name: "Avocado", price: 2.99),
        Addoon(name: "Sautéed Mushrooms", price: 1.49),
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
        Addoon(name: "Grilled Chicken", price: 3.49),
        Addoon(name: "Bacon Bits", price: 1.49),
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
        Addoon(name: "Feta Cheese", price: 1.99),
        Addoon(name: "Olives", price: 0.99),
      ],
    ),
    Food(
      name: "Hawaiian Salad",
      description: "Tropical flavors with pineapple, ham, and mixed greens.",
      image: "assets/images/salads/hawaiian_salad.jpg",
      price: 7.49,
      category: FoodCategory.salads,
      addons: [
        Addoon(name: "Grilled Shrimp", price: 4.49),
        Addoon(name: "Avocado", price: 2.99),
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
        Addoon(name: "Salami", price: 1.99),
        Addoon(name: "Pepperoncini", price: 0.99),
      ],
    ),

    // Sides
    const Food(
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
        Addoon(name: "Extra Sauce", price: 1.49),
      ],
    ),
    const Food(
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
        Addoon(name: "Vanilla Ice Cream", price: 1.99),
      ],
    ),
    Food(
      name: "Cheesecake",
      description: "Rich and creamy cheesecake with a graham cracker crust.",
      image: "assets/images/desserts/cheesecake.jpg",
      price: 5.49,
      category: FoodCategory.desserts,
      addons: [
        Addoon(name: "Strawberry Sauce", price: 1.49),
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
        Addoon(name: "Whipped Cream", price: 0.99),
      ],
    ),

    // Drinks
    const Food(
      name: "Coke",
      description: "Classic carbonated soft drink.",
      image: "assets/images/drinks/coke.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      addons: [],
    ),
    const Food(
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
        Addoon(name: "Mint", price: 0.99),
      ],
    ),
    const Food(
      name: "Orange Juice",
      description: "Freshly squeezed orange juice, served chilled.",
      image: "assets/images/drinks/orange_juice.jpg",
      price: 2.99,
      category: FoodCategory.drinks,
      addons: [],
    ),
  ];

  List<Food> get menu => _menu;
}
