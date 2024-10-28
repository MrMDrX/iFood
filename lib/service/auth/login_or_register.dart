import 'package:flutter/material.dart';
import 'package:ifood/screens/login_screen.dart';
import 'package:ifood/screens/register_screen.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool showLogin = true;

  void toggleView() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return showLogin
        ? LoginScreen(onPressed: toggleView)
        : RegisterScreen(onPressed: toggleView);
  }
}
