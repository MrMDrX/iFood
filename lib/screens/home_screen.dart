import 'package:flutter/material.dart';
import 'package:ifood/widgets/drawer.dart';
import 'package:ifood/widgets/my_description_box.dart';
import 'package:ifood/widgets/my_location.dart';
import 'package:ifood/widgets/my_sliver_app_bar.dart';
import 'package:ifood/widgets/my_tab_bar.dart';

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
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
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
                  const MyLocation(),
                  const MyDescriptionBox(),
                ],
              )),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.all(24),
              child: const Center(child: Text("Home tab")),
            ),
            Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.all(24),
              child: const Center(child: Text("Favorites tab")),
            ),
            Container(
              color: Theme.of(context).colorScheme.surface,
              padding: const EdgeInsets.all(24),
              child: const Center(child: Text("Profile tab")),
            ),
          ],
        ),
      ),
    );
  }
}
