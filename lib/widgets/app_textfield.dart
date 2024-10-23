import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  const AppTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).colorScheme.primary,
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary,
                width: 2,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              )),
        ),
      ),
    );
  }
}
