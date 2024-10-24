import 'package:flutter/material.dart';

class MyDescriptionBox extends StatelessWidget {
  const MyDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle primaryTxtStyle = TextStyle(
      color: Theme.of(context).colorScheme.inversePrimary,
    );
    final TextStyle secondaryTxtStyle = TextStyle(
      color: Theme.of(context).colorScheme.primary,
    );
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.secondary,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
      ),
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text("\$0.99", style: primaryTxtStyle),
              Text("Delivery fee", style: secondaryTxtStyle),
            ],
          ),
          Column(
            children: [
              Text("15-30 min", style: primaryTxtStyle),
              Text("Delivery time", style: secondaryTxtStyle),
            ],
          )
        ],
      ),
    );
  }
}
