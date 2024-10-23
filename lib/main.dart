import 'package:flutter/material.dart';
import 'package:ifood/screens/login_screen.dart';
import 'package:ifood/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => ThemeProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'iFood',
      debugShowCheckedModeBanner: false,
      home: LoginScreen(
        onPressed: () {},
      ),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
