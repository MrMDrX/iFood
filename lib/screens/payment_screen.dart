import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:ifood/screens/delivery_progress_screen.dart';
import 'package:ifood/widgets/app_button.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool showBackView = false;
  void onCreditCardModelChange(CreditCardModel ccm) {
    setState(() {
      cardNumber = ccm.cardNumber;
      expiryDate = ccm.expiryDate;
      cardHolderName = ccm.cardHolderName;
      cvvCode = ccm.cvvCode;
    });
  }

  void onPayTapped() {
    if (formKey.currentState!.validate()) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text("Confirm payment"),
              content: SingleChildScrollView(
                  child: ListBody(children: [
                Text("Card Number: $cardNumber"),
                Text("Expiry Date: $expiryDate"),
                Text("CVV Code: $cvvCode"),
                Text("Card Holder Name: $cardHolderName"),
              ])),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DeliveryProgressScreen(),
                        ),
                      );
                    },
                    child: const Text("Pay")),
              ],
            );
          });
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Checkout"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            CreditCardWidget(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: showBackView,
              onCreditCardWidgetChange: (onCreditCardWidgetChange) {},
              glassmorphismConfig: Glassmorphism(
                blurX: 30,
                blurY: 30,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.inversePrimary,
                    Theme.of(context).colorScheme.primary,
                  ],
                ),
              ),
            ),
            CreditCardForm(
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              onCreditCardModelChange: onCreditCardModelChange,
              formKey: formKey,
            ),
            const Spacer(),
            AppButton(text: "Pay now", onTap: onPayTapped),
            const SizedBox(height: 24),
          ],
        ));
  }
}
