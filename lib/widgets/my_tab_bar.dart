import 'package:flutter/material.dart';
import 'package:ifood/models/food_model.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values
        .map((category) => Tab(
              text: category.name,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: _buildCategoryTabs(),
      indicatorWeight: 4,
      indicatorColor: Theme.of(context).colorScheme.inversePrimary,
      unselectedLabelColor: Theme.of(context).colorScheme.primary,
      labelColor: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
