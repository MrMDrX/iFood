import 'package:flutter/material.dart';
import 'package:ifood/models/restaurant_model.dart';
import 'package:provider/provider.dart';

class MyLocation extends StatelessWidget {
  MyLocation({super.key});

  final textController = TextEditingController();

  void openLocationSearch(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Your location"),
            content: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Enter address",
                hintStyle: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Provider.of<Restaurant>(context, listen: false)
                      .updateDeliveryAddress(textController.text);
                  textController.clear();
                },
                child: const Text("Save"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Deliver now",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          GestureDetector(
            onTap: () => openLocationSearch(context),
            child: Row(
              children: [
                Consumer<Restaurant>(builder: (context, restaurant, child) {
                  return Text(
                    restaurant.deliveryAddress,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  );
                }),
                const Icon(Icons.keyboard_arrow_down_rounded),
              ],
            ),
          )
        ],
      ),
    );
  }
}
