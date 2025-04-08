import 'package:flutter/material.dart';
import 'package:backbone/constant/app_images.dart';
import '../utils/gradient_text.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  int? _selectedPaymentMethod;

  // Payment method lists
  final List<Map<String, String>> paymentMethods = [
    {'name': 'Google Pay', 'image': 'assets/gpay.png'},
    {'name': 'Pay Pal', 'image': 'assets/paypal.png'},
    {'name': 'VISA', 'image': 'assets/visa.png'},
    {'name': 'Apple Pay', 'image': 'assets/applepay.png'},
  ];

  final List<Map<String, String>> netbanking = [
    {'name': 'Kotak Bank', 'image': 'assets/kotak.png'},
    {'name': 'SBI', 'image': 'assets/sbi.png'},
  ];

  final List<Map<String, String>> cardpayment = [
    {'name': 'Debit Card', 'image': 'assets/debitcard.png'},
    {'name': 'Credit Card', 'image': 'assets/creditcard.png'},
  ];


  int get _totalItems => cardpayment.length + paymentMethods.length + netbanking.length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GradientText(text: "Choose Payment Method", fontSize: 20),
            SizedBox(height: 10),
            GradientText(text: "Card Payment", fontSize: 20),
            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: cardpayment.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = index;
                      });
                    },
                    child: ListTile(
                      leading: Image.asset(cardpayment[index]['image']!),
                      title: Text(cardpayment[index]['name']!, style: TextStyle(color: Colors.white)),
                      subtitle: Text("**** 4444", style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        _selectedPaymentMethod == index
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked_outlined,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            GradientText(text: "UPI Payment", fontSize: 20),
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethod = index + cardpayment.length;
                      });
                    },
                    child: ListTile(
                      leading: Image.asset(paymentMethods[index]['image']!),
                      title: Text(paymentMethods[index]['name']!, style: TextStyle(color: Colors.white)),
                      subtitle: Text("**** 4444", style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        _selectedPaymentMethod == index + cardpayment.length
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked_outlined,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
            GradientText(text: "Net Banking", fontSize: 20),
            SizedBox(
              height: 200,
              child: ListView.builder(
                itemCount: netbanking.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {

                        _selectedPaymentMethod = index + cardpayment.length + paymentMethods.length;
                      });
                    },
                    child: ListTile(
                      leading: Image.asset(netbanking[index]['image']!),
                      title: Text(netbanking[index]['name']!, style: TextStyle(color: Colors.white)),
                      subtitle: Text("**** 4444", style: TextStyle(color: Colors.white)),
                      trailing: Icon(
                        _selectedPaymentMethod == index + cardpayment.length + paymentMethods.length
                            ? Icons.radio_button_checked
                            : Icons.radio_button_unchecked_outlined,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
