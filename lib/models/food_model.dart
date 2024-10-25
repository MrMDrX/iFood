class Food {
  final String name;
  final String description;
  final String image;
  final double price;
  final FoodCategory category;
  final List<Addoon> addons;

  const Food({
    required this.category,
    required this.addons,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
  });
}

enum FoodCategory {
  burgers,
  salads,
  sides,
  desserts,
  drinks,
}

class Addoon {
  final String name;
  final double price;

  Addoon({required this.name, required this.price});
}
