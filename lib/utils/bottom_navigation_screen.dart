import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/constant/app_images.dart';
import 'package:backbone/login/bottom_navigation/history_screen.dart';
import 'package:backbone/login/bottom_navigation/home_screen.dart';
import 'package:backbone/login/bottom_navigation/live_auction_screen.dart';
import 'package:backbone/login/bottom_navigation/my_chits_screen.dart';
import 'package:backbone/utils/svg_image.dart';
import 'package:flutter/material.dart';



class Bottom_Navigation extends StatefulWidget {
  @override
  _Bottom_NavigationState createState() => _Bottom_NavigationState();
}

class _Bottom_NavigationState extends State<Bottom_Navigation> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Home_Screen(),
    My_Chits_Screen(),
    Live_Auction_Screen(),
    History_Screen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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