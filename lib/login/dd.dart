import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';

class OTPVerificationPage extends StatefulWidget {
  @override
  _OTPVerificationPageState createState() => _OTPVerificationPageState();
}

class _OTPVerificationPageState extends State<OTPVerificationPage> {
  TextEditingController otpController = TextEditingController();
  int countdown = 30;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        setState(() {
          countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void verifyOTP() {
    print("Entered OTP: ${otpController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image:AssetImage("assets/otp.png")),
            SizedBox(height: 20),
            Text(
              "OTP code sent to your mobile number",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text("Enter the code", style: TextStyle(fontSize: 18)),

            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                controller: otpController,
                keyboardType: TextInputType.number,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 50,
                  fieldWidth: 50,
                  activeFillColor: Colors.grey.shade800,
                  inactiveFillColor: Colors.grey,
                  selectedFillColor: Colors.grey,
                  activeColor: Colors.purple,
                  inactiveColor: Colors.grey,
                  selectedColor: Colors.purple,
                ),
                onChanged: (value) {},
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: countdown > 0
                  ? Row(
                children: [
                  Text("Resend OTP ",
                      style: TextStyle(color: Colors.blue)),
                  Padding(
                    padding: const EdgeInsets.only(left: 120),
                    child: Text("${countdown}s",
                        style: TextStyle(color: Colors.black,fontSize: 15)),
                  ),
                ],
              )
                  : GestureDetector(
                  onTap: () {
                    setState(() {
                      countdown = 30;
                      startCountdown();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Text("Resend OTP", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold,fontSize: 12)),
                  )),
            ),

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: verifyOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade800,
                padding: EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
              ),
              child: Text("Verify", style: TextStyle(color: Colors.white,fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}