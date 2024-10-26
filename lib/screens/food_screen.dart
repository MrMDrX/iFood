import 'package:flutter/material.dart';
import 'package:ifood/models/food_model.dart';
import 'package:ifood/models/restaurant_model.dart';
import 'package:ifood/widgets/app_button.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatefulWidget {
  final Food food;
  final Map<Addon, bool> selectedAddons = {};

  FoodScreen({super.key, required this.food}) {
    for (Addon addon in food.addons) {
      selectedAddons[addon] = false;
    }
  }

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {
  void addToCart(Food food, Map<Addon, bool> selectedAddons) {
    Navigator.pop(context);
    List<Addon> currentSelectedAddons = [];
    for (Addon addon in widget.food.addons) {
      if (widget.selectedAddons[addon] == true) {
        currentSelectedAddons.add(addon);
      }
    }
    context.read<Restaurant>().addToCart(food, currentSelectedAddons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.food.name,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  widget.food.image,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* Text(
                    widget.food.name,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const SizedBox(height: 10), */
                  Text(
                    '\$${widget.food.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.food.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Addons",
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                  // addons
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.food.addons.length,
                    itemBuilder: (context, index) {
                      final addon = widget.food.addons[index];
                      return CheckboxListTile(
                        title: Text(addon.name),
                        subtitle: Text("\$ ${addon.price.toStringAsFixed(2)}"),
                        value: widget.selectedAddons[addon],
                        onChanged: (bool? value) {
                          setState(() {
                            widget.selectedAddons[addon] = value!;
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  AppButton(
                    text: 'Add to cart',
                    onTap: () {
                      addToCart(widget.food, widget.selectedAddons);
                    },
                  ),
                  const SizedBox(height: 24),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
