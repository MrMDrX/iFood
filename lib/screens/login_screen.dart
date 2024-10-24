import 'package:flutter/material.dart';
import 'package:ifood/screens/home_screen.dart';
import 'package:ifood/widgets/app_button.dart';
import 'package:ifood/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? onPressed;

  const LoginScreen({super.key, required this.onPressed});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  void login() {
    // TODO: implement login

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock_open_rounded,
            size: 96,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          const SizedBox(height: 24),
          const Text(
            'iFood',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w700,
              letterSpacing: 4,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Welcome Back',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 24),
          AppTextField(
              hintText: "Email",
              controller: emailController,
              obscureText: false),
          const SizedBox(height: 24),
          AppTextField(
              hintText: "Password",
              controller: passwordController,
              obscureText: true),
          const SizedBox(height: 24),
          AppButton(text: "Sign In", onTap: login),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                  onPressed: widget.onPressed,
                  child: const Text("Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))
            ],
          )
        ],
      ),
    );
  }
}
