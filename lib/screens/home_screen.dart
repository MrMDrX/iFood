import 'package:flutter/material.dart';
import 'package:ifood/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text('iFood'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
