import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  const AppButton({super.key, required this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(
              text,
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            )));
  }
}
