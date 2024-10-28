import 'package:flutter/material.dart';
import 'package:ifood/service/auth/auth_service.dart';
import 'package:ifood/widgets/app_button.dart';
import 'package:ifood/widgets/app_textfield.dart';

class RegisterScreen extends StatefulWidget {
  final void Function()? onPressed;

  const RegisterScreen({super.key, required this.onPressed});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  void register() async {
    final authService = AuthService();
    if (passwordController.text == confirmPasswordController.text) {
      try {
        await authService.signUpWithEmailAndPassword(
            emailController.text, passwordController.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Error"),
                content: Text(e.toString()),
              );
            });
      }
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              title: Text("Error"),
              content: Text("Passwords do not match"),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.fastfood_rounded,
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
            'Let\'s get started',
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
          AppTextField(
              hintText: "Confirm password",
              controller: confirmPasswordController,
              obscureText: true),
          const SizedBox(height: 24),
          AppButton(text: "Sign Up", onTap: register),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                  onPressed: widget.onPressed,
                  child: const Text("Sign In",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)))
            ],
          )
        ],
      ),
    );
  }
}
