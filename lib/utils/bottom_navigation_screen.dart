import 'package:backbone/MyChit/myChit.dart';
import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/history_screen.dart';
import 'package:backbone/login/bottom_navigation/home_screen.dart';
import 'package:backbone/login/bottom_navigation/live_auction_screen.dart';
import 'package:backbone/login/bottom_navigation/my_chits_screen.dart';
import 'package:backbone/login/bottom_navigation/notification_screen.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/utils/action_button.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:backbone/utils/image_card.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class Bottom_Navigation extends StatefulWidget {
  @override
  _Bottom_NavigationState createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> chitPlans = [
    {"title": "Profile","icon": Icons.person_2_outlined,},
    {"title": "Verification","icon": Icons.domain_verification},
    {"title": "Settings","icon": Icons.person_2_outlined},
    {"title": "Terms & Conditions","icon": Icons.person_2_outlined},
    {"title": "Refer & Earn","icon": Icons.person_2_outlined},
    {"title": "Complaint & Help","icon": Icons.person_2_outlined},
  ];

  final List<Map<String, dynamic>> page = [
    {"title": "Home"},
    {"title": "My Chits"},
    {"title": "Live Auction"},
    {"title": "history"}
  ];

  int index =0;

  final List<Widget> _screens = [
    Home_Screen(),
    Mychit(),
    Live_Auction_Screen(),
    History_Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Text(
            "Are you sure you want to log out?",
            style: TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login_Screen()));
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("successfully Logged out")));
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(page[_selectedIndex]['title']),
          iconTheme: IconThemeData(color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          actions: [
            GestureDetector(
              onTap: () {},
              child: ImageCard(imageUrl: AppImages().whatsAppIcon),
            ),
            ActionButton(url: AppImages().bellIcon, onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Notification_Screen()));
            }),
          ],
        ),
        drawer: Drawer(
          backgroundColor: AppColors().blackColor,
          child: Padding(
            padding:  EdgeInsets.only(left:20.sp,top: 20.sp),
            child: Column(
              children: [
                Row(children: [
                  GradientIcon(child: IconButton(onPressed: (){
                    Navigator.pop(context);
                  }, icon: Icon(Icons.arrow_back_ios,color: AppColors().whiteColor))),
                  SizedBox(width: 8.w),
                  GradientText(text: "Menu",fontSize: 16.sp,),
                ],),
                Expanded(
                  child: ListView.builder(
                      itemCount: "title".length,
                      itemBuilder: (context,index){
                        return Padding(
                          padding:  EdgeInsets.only(right:30.w),
                          child: Container(height: 41.h,width: 251.w,
                            decoration: BoxDecoration(
                              border: Border(bottom: BorderSide(color: Color(0xffDEAB3D)))
                            ),
                            child: ListTile(
                              leading: GradientIcon(child: Icon(chitPlans[index]["icon"],color: Colors.white,size: 24.sp,)),
                              title: GradientText(text: chitPlans[index]["title"],fontSize: 14.sp,),
                              trailing: GradientIcon(child: Icon(Icons.arrow_forward_ios,size: 18.sp,color: Colors.white,))
                            ),
                          ),
                        );
                      }),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    _showLogoutDialog(context);
                  },
                  child: Row(children: [
                    GradientIcon(child: Icon(Icons.logout,color: AppColors().whiteColor)),
                    SizedBox(width: 8.w),
                    GradientText(text: "Logout",fontSize: 16.sp,),
                  ],),
                ),
                SizedBox(height: 10.h)
              ],
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: _screens[_selectedIndex],

        bottomNavigationBar:  Padding(
        padding: const EdgeInsets.only(bottom:10,left: 16,right: 16),
    child: ClipRRect(
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
    bottomLeft: Radius.circular(30),
    bottomRight: Radius.circular(30)
    ),
    child: BottomNavigationBar(
    onTap:_onItemTapped ,
    currentIndex: _selectedIndex,
    backgroundColor: Colors.black,
    selectedItemColor: AppColors().blackColor,
    unselectedItemColor: Colors.black,
    showSelectedLabels: true,
    showUnselectedLabels: true,
        items:  [
          BottomNavigationBarItem(
            icon: SvgImageCard(
              imageUrl: AppImages().homeIcon,
              height: 30,
              width: 30,
            ),
            activeIcon: SvgImageCard(
              imageUrl: AppImages().filledHomeIcon,
              height: 30,
              width: 30,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgImageCard(
              imageUrl: AppImages().chitsIcon,
              width: 30,
              height: 30,
            ),
            activeIcon: SvgImageCard(
              imageUrl: AppImages().filledChitsIcon,
              height: 30,
              width: 30,
            ),
            label: 'My Chits',
          ),
          BottomNavigationBarItem(
            tooltip: 'Home Icon',
            icon: SvgImageCard(
              imageUrl: AppImages().autionIcon,
              height: 30,
              width: 30,
            ),
            activeIcon: SvgImageCard(
              imageUrl: AppImages().filledAutionIcon,
              height: 30,
              width: 30,
            ),
            label: 'Live Auction',
          ),
          BottomNavigationBarItem(
            icon: SvgImageCard(
              imageUrl: AppImages().historyIcon,
              height: 30,
              width: 30,
            ),
            activeIcon: SvgImageCard(
              imageUrl: AppImages().filledHistoryIcon,
              height: 30,
              width: 30,
            ),
            label: 'History',
          ),
        ],// To match the design
      ),
    )
        )
    );
  }
}