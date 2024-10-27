import 'package:flutter/material.dart';
import 'package:ifood/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Thank you for your order !",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
              ),
              borderRadius: BorderRadius.circular(16),
              color: Theme.of(context).colorScheme.tertiary,
            ),
            padding: const EdgeInsets.all(24),
            child: Consumer<Restaurant>(builder: (context, restaurant, child) {
              return Text(
                restaurant.displayCartReceipt(),
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              );
            }),
          ),
          const SizedBox(height: 24),
          const Text(
            "Estimated Delivery Time : 15-30 min",
          ),
        ],
      ),
    );
  }
}
