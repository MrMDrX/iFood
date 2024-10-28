import 'package:flutter/material.dart';
import 'package:ifood/models/cart_item.dart';
import 'package:ifood/models/restaurant_model.dart';
import 'package:ifood/widgets/quantity_selector.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  final CartItem cartItem;

  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            color: Theme.of(context).colorScheme.tertiary,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Image.asset(
                        cartItem.food.image,
                        height: 100,
                        width: 100,
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text("\$${cartItem.food.price}"),
                        const SizedBox(height: 8),
                        QuantitySelector(
                          quantity: cartItem.quantity,
                          food: cartItem.food,
                          onIncrement: () {
                            restaurant.addToCart(
                                cartItem.food, cartItem.addOns);
                          },
                          onDecrement: () {
                            restaurant.removeFromCart(cartItem);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  height: cartItem.addOns.isEmpty ? 0 : 48,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    children: cartItem.addOns
                        .map(
                          (addon) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: FilterChip(
                              label: Row(
                                children: [
                                  Text(addon.name),
                                  const SizedBox(width: 8),
                                  Text("\$${addon.price}"),
                                ],
                              ),
                              onSelected: (_) {},
                              shape: StadiumBorder(
                                side: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              backgroundColor:
                                  Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
