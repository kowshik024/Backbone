import 'package:backbone/menu/settings.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';

void main() {
  runApp( terms());
}

class terms extends StatelessWidget {
  terms({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const UpdateScreen(),
    );
  }
}

class UpdateScreen extends StatelessWidget {
  const UpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title:  Text(
          'Terms & Conditions',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
          },

        ),
      ),
      body:   Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30,right: 120),
            child: Text(
              '* Data safety',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 45),
            child: GradientText(text: "The developer of ChitSoft provides\ninformation on how they collect and share\ndata. Data privacy and security practices\nmay vary based on age,region and use.",fontSize: 14,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,right: 70),
            child: Text(
              '* Terms of Service',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: GradientText(text: "The terms of service for a service may be\nfound on the service's Application.The\nterms of service may be updated,changed\n or replaced at the discretion of the service\nprovider",fontSize: 14,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30,right: 30),
            child: Text(
              '*Acceptance of terms',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: GradientText(text: "User must read and agree to the term\nand conditions to access the service or\nApplication.Users who do not agree to the\nterms and conditions should not access\nthe Application or register for\nmembership.",fontSize: 14,),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: GradientText(text: "Chit Fubds are legal in India and are\n regulated by the chit funds Act of 1262.\nThe act governs the registration and\nmanagement of chit funds",fontSize: 14,),
          ),

        ],
      ),



    );
  }
}