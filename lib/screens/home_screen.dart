import 'package:flutter/material.dart';
import 'package:ifood/models/food_model.dart';
import 'package:ifood/models/restaurant_model.dart';
import 'package:ifood/screens/food_screen.dart';
import 'package:ifood/widgets/drawer.dart';
import 'package:ifood/widgets/food_tile.dart';
import 'package:ifood/widgets/description_box.dart';
import 'package:ifood/widgets/my_location.dart';
import 'package:ifood/widgets/my_sliver_app_bar.dart';
import 'package:ifood/widgets/my_tab_bar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  List<Food> _filterFoodByCategory(FoodCategory category, List<Food> menu) {
    return menu.where((food) => food.category == category).toList();
  }

  List<Widget> getFoodInThisCategory(List<Food> menu) {
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterFoodByCategory(category, menu);
      return ListView.builder(
          itemCount: categoryMenu.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(0),
          itemBuilder: (context, index) {
            final Food food = categoryMenu[index];
            return FoodTile(
              food: food,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodScreen(
                      food: food,
                    ),
                  ),
                );
              },
            );
          });
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      drawer: const AppDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    indent: 24,
                    endIndent: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  MyLocation(),
                  const DescriptionBox(),
                ],
              )),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}
