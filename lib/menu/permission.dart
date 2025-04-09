import 'package:backbone/menu/settings.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PermissionsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PermissionsScreen extends StatefulWidget {
  @override
  _PermissionsScreenState createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  bool locationService = true;
  bool contactsPermission = true;
  bool cameraPermission = true;
  bool phoneMessagesPermission = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        title: Text('Permissions', style: TextStyle(color: Colors.white)),
        actions: [Image(image: AssetImage("assets/whatsapp.png"))],
      ),
      body: ListView(
        children: [
          permissionTile("Location Service", locationService, (val) {
            setState(() => locationService = val);
          }, Icons.location_on),
          permissionTile("Contacts Permissions", contactsPermission, (val) {
            setState(() => contactsPermission = val);
          }, Icons.contacts),
          permissionTile("Camera Permissions", cameraPermission, (val) {
            setState(() => cameraPermission = val);
          }, Icons.camera_alt),
          permissionTile("Phone & Messages Permissions", phoneMessagesPermission, (val) {
            setState(() => phoneMessagesPermission = val);
          }, Icons.message),
        ],
      ),
    );
  }

  Widget permissionTile(String title, bool value, Function(bool) onChanged, IconData icon) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          GradientIcon(child: Icon(icon,color: Colors.white,)),
          SizedBox(width: 16),
          Expanded(
            child: GradientText( text: title ,fontSize: 16,
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor:  Color(0xffDEAB3D),
          )
        ],
      ),
    );
  }
}