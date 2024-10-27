import 'package:flutter/material.dart';
import 'package:ifood/models/restaurant_model.dart';
import 'package:ifood/screens/payment_screen.dart';
import 'package:ifood/widgets/app_button.dart';
import 'package:ifood/widgets/cart_tile.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(builder: (context, restaurant, child) {
      final cart = restaurant.cart;
      final isCartEmpty = cart.isEmpty;
      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: isCartEmpty
                      ? null
                      : () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Clear Cart"),
                                  content: const Text(
                                      "Are you sure you want to clear the cart?"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          restaurant.clearCart();
                                        },
                                        child: const Text("Clear")),
                                    TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel")),
                                  ],
                                );
                              });
                        },
                  icon: Icon(
                    Icons.delete_forever_rounded,
                    size: 28,
                    color: isCartEmpty
                        ? Theme.of(context).disabledColor
                        : Theme.of(context).colorScheme.inversePrimary,
                  )),
            )
          ],
        ),
        body: isCartEmpty
            ? const Center(
                child: Text(
                  "CART IS EMPTY !",
                  style: TextStyle(
                    fontSize: 24,
                    letterSpacing: 4,
                  ),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final cartItem = cart[index];
                        return CartTile(cartItem: cartItem);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: AppButton(
                      text: "Checkout",
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
