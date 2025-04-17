import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

class Notification_Screen extends StatefulWidget {
  const Notification_Screen({super.key});

  @override
  State<Notification_Screen> createState() => _Notification_ScreenState();
}

class _Notification_ScreenState extends State<Notification_Screen> with SingleTickerProviderStateMixin  {

  final List<Map<String, String>> officialNotifications = [
    {
      'title': 'New Launch',
      'gif': 'assets/bell.gif',
      'time': '03.43 PM',
      'description':
      'Your credit card **4325 bill is due on 15 October. To avoid extra charges, kindly pay the outstanding amount before the given date.'
    },
    {
      'title': 'Due Amount',
      'gif': 'assets/bell.gif',
      'time': '01.13 PM',
      'description':
      'Your credit card **4325 bill is due on 15 October. To avoid extra charges, kindly pay the outstanding amount before the given date.'
    }
  ];

  final List<Map<String, String>> paymentNotifications = [
    {
      'title': 'Payment Alert !',
      'gif': 'assets/no1.gif',
      'time': '03.43 PM',
      'description':
      'Your credit card **4325 bill is due on 15 October. To avoid extra charges, kindly pay the outstanding amount before the given date.'
    },
    {
      'title': 'Payment successfully',
      'gif': 'assets/no2.gif',
      'time': '01.13 PM',
      'description':
      'Your credit card **4325 bill is due on 15 October. To avoid extra charges, kindly pay the outstanding amount before the given date.'
    },
    {
      'title': 'Payment Failed',
      'gif': 'assets/no3.gif',
      'time': '',
      'description':
      'Your credit card **4325 bill is due on 15 October. To avoid extra charges, kindly pay the outstanding amount before the given date.'
    }
  ];

  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors().blackColor,
        appBar:AppBar(
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 24.sp,)),
          title: Text("Notification",style: GoogleFonts.inriaSans(color: Colors.white,fontSize: 16.sp),),
          backgroundColor: AppColors().blackColor,
        ),
        resizeToAvoidBottomInset: true,
        body:SafeArea(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.w),
                child: GradientContainer(
                  vertPadding: 0,
                  horPadding: 0,
                  borderRadius: BorderRadius.circular(50.r),
                  child: TabBar(
                    controller: _tabController,
                    unselectedLabelStyle: TextStyle(
                      fontFamily: 'Inria Sans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'Inria Sans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    dividerHeight: 0,
                    splashBorderRadius: BorderRadius.circular(8.r),
                    indicatorPadding: EdgeInsets.zero,
                    padding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.white,
                    indicator: BoxDecoration(
                     gradient: LinearGradient(colors: AppColors().gradients),
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    tabAlignment: TabAlignment.fill,
                    tabs: [
                      Tab(text: 'Official notification'),
                      Tab(text: 'Payment Notification'),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [NotificationList(notifications: officialNotifications),
                    NotificationList(notifications: paymentNotifications),],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class NotificationList extends StatelessWidget {
  final List<Map<String, String>> notifications;

  NotificationList({required this.notifications});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final notification = notifications[index];
        return Padding(
          padding:  EdgeInsets.all(8.0),
          child: Container(
            height: 120.h,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffDEAB3D))),
            ),
            child:
            ListTile(
              leading: GifView.asset(
                notification['gif'] ?? '',
                height: 60.h,
                width: 60.h,
                frameRate: 30,
              ),
              title:GradientText(text: notification['title']??'',fontSize: 14.sp,fontWeight: FontWeight.w700,),
              subtitle: FlutterCustomText(text:  notification['description'] ?? '',color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.w400,),
              trailing: Text(
                notification['time'] ?? '',
                style: TextStyle(color: Colors.white, fontSize: 12.sp,fontWeight: FontWeight.w400,),
              ),
            ),

          ),
        );
      },
    );
  }
}