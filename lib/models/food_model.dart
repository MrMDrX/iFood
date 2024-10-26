class Food {
  final String name;
  final String description;
  final String image;
  final double price;
  final FoodCategory category;
  List<Addon> addons;

  Food({
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

class Addon {
  final String name;
  final double price;

  Addon({required this.name, required this.price});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Addon && name == other.name && price == other.price;
  }

  @override
  int get hashCode => name.hashCode ^ price.hashCode;
}
