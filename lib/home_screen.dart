import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/stripe_payment/payment_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: amountController,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  print(formKey.currentState!.validate());
                  if (formKey.currentState!.validate()) {
                    await PaymentManager.makePayment(
                        int.parse(amountController.text),
                        "EGP",
                        nameController.text);
                  } else {}
                },
                child: Text("Pay ${amountController.text} pound"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
