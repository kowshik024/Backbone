import 'package:backbone/Liveauction/LiveScreen.dart';
import 'package:flutter/material.dart';
import 'package:backbone/constant/app_images.dart';
import '../constant/app_colors.dart';
import '../login/bottom_navigation/bottom_navigation_screen.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';
import 'dart:async';


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
            Center(
              child: SizedBox(height: 44,width: 300,
                child: GradientColoredButton(
                  onTap: () {},
                  child: FlutterCustomText(
                    text: 'Pay',
                    color: AppColors().blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}






class PaymentResult extends StatefulWidget {
  @override
  _PaymentResultState createState() => _PaymentResultState();
}

class _PaymentResultState extends State<PaymentResult>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _textController;
  late AnimationController _buttonController;

  late Animation<double> _iconScaleAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _buttonFadeAnimation;



  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _textController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _iconScaleAnimation = CurvedAnimation(
      parent: _iconController,
      curve: Curves.elasticOut,
    );

    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOut,
      ),
    );

    _buttonFadeAnimation = CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeIn,
    );

    _iconController.forward();
    Future.delayed(Duration(milliseconds: 400), () => _textController.forward());
    Future.delayed(Duration(milliseconds: 800), () => _buttonController.forward());


    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottom_Navigation()),
      );
    });
  }



  @override
  void dispose() {
    _iconController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _iconScaleAnimation,
                child: Icon(
                  Icons.verified,
                  color: Colors.green,
                  size: 120,
                ),
              ),
              SizedBox(height: 20),
              SlideTransition(
                position: _textSlideAnimation,
                child: Column(
                  children: [
                    GradientText(text: "Payment Successfully ",fontSize: 30,),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
