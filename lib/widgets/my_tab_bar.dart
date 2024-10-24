import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(
          icon: Icon(Icons.home_rounded),
        ),
        Tab(
          icon: Icon(Icons.favorite_rounded),
        ),
        Tab(
          icon: Icon(Icons.person_rounded),
        )
      ],
    );
  }
}
