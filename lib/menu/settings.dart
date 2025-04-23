
import 'package:backbone/menu/permission.dart';
import 'package:backbone/menu/update.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/gradient_icon.dart';
import '../utils/gradient_text.dart';


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios)),
          backgroundColor: Color(0xff000000),
          title: Text('Settings', style: GoogleFonts.inriaSans(color:Color(0xffFFFFFF))),
          iconTheme: IconThemeData(color:Color(0xffFFFFFF)),
          actions: [GifView.asset(
            'assets/whatsapp.gif',
            height: 46.h,
            width: 46.h,
            frameRate: 30,
          ),],
        ),
        body: ListView(
          children: [
            ListTile(
              leading: GradientIcon(child: Icon(Icons.system_update,color: Colors.white,)),
              title:GradientText(text: "Update",fontSize: 14,),
              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios_rounded))
              ,             onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateScreen()));
            },
            ),
            Divider(
              color: Colors.yellow,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading:GradientIcon(child: Icon(Icons.settings_suggest_rounded,color: Colors.white,)),
              title: GradientText(text: "Permission",fontSize: 14,),
              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios_rounded)),
              onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context) => PermissionsScreen()));
              },
            ),
            Divider(
              color: Colors.yellow,
              indent: 10,
              endIndent: 10,
            ),
            ListTile(
              leading: GradientIcon(child: Icon(Icons.credit_card_off_outlined,color: Colors.white,)),
              title: GradientText(text: "Delete User Data",fontSize: 14,),
              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios_rounded)),
              onTap: () {
                // Delete user data logic
              },
            ),
            Divider(
              color: Colors.yellow,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),

    );
  }
}