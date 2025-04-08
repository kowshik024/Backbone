import 'package:backbone/menu/settings.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';

void main() {
  runApp( update());
}

class update extends StatelessWidget {
  update({super.key});

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
          'Update',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
    },

        ),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage("assets/update2.png")),
            SizedBox(height: 20),
            GradientText(text: "New Update is Availabe",fontSize: 14,),
            SizedBox(height: 10),
            Text(
              'Update your application\nto the latest version',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            GradientText(text: "A brand new version of the chit soft app is\navailable in the play store please update your\napp to use all of amazing features!",fontSize: 14,),
            SizedBox(height: 300),

            Padding(
              padding: EdgeInsets.only(left: 50, right: 50),
              child: SizedBox(height: 44,width: 300,
                child: GradientColoredButton(
                  onTap: () {},
                  child: FlutterCustomText(
                    text: 'VERIFY',
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