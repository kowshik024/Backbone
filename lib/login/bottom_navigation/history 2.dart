import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gif_view/gif_view.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/chit_api_service.dart';



class ChitHistoryScreen extends StatefulWidget {
  @override
  _ChitHistoryScreenState createState() => _ChitHistoryScreenState();
}

class _ChitHistoryScreenState extends State<ChitHistoryScreen> with SingleTickerProviderStateMixin  {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    ChitApiService().fetchChitList();
  }



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors().blackColor,
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
                      fontFamily: 'InriaSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                    labelStyle: TextStyle(
                      fontFamily: 'InriaSans',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
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
                      Tab(text: 'Chit History',),
                      Tab(text: 'Payment History'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    ChitHistoryTab(),
                    PaymentHistoryTab(),
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


class ChitHistoryTab extends StatefulWidget {
  const ChitHistoryTab({super.key});

  @override
  State<ChitHistoryTab> createState() => _ChitHistoryTabState();
}

class _ChitHistoryTabState extends State<ChitHistoryTab> {



  List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];

  List<String> chitDates =[
    
    'May -2023',
    'June -2023',

  ];

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(

        child: ListView.builder(
          itemCount: chitDates.length,
          itemBuilder: (context, index) {
            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(children: [
                  Container(
                    height: 41.w,
                    width:320.w ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.only(left: 16),
                          child: Text(chitDates[index],style: GoogleFonts.inriaSans(fontSize: 20,fontWeight: FontWeight.w400),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.print),
                        )
                      ],),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradients,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                    ),
                  ),
                  Container(
                    height: 190.h,
                    width: 320.w,
                    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Row(

                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 6.h,),
                          Text('Chit Value',style:GoogleFonts.inriaSans(color: Colors.white),),
                          SizedBox(height: 6.h,),
                          GradientText(text: "₹ 1,00,000",),
                          SizedBox(height: 6.h,),
                          Text('Total Inst',style:GoogleFonts.inriaSans(color: Colors.white),),
                          SizedBox(height: 6.h,),
                          GradientText(text: "25",),
                          SizedBox(height: 6.h,),
                          Text('Auction Details',style:GoogleFonts.inriaSans(color: Colors.white),),
                          SizedBox(height: 6.h,),
                          GradientText(text: "10/03/2022",),
                          SizedBox(height: 6.h,),

                        ],
                      ),
                      SizedBox(width: 90.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        SizedBox(height: 6.h,),
                        Text('Paid',style:GoogleFonts.inriaSans(color: Colors.white),),
                        SizedBox(height: 6.h,),
                        GradientText(text: "25/25",),
                        SizedBox(height: 6.h,),
                        Text('Status',style:GoogleFonts.inriaSans(color: Colors.white),),
                        SizedBox(height: 6.h,),
                        Text('completed',style:GoogleFonts.inriaSans(color: Colors.green),),



                      ],)
                    ],) ,
                  )


                ],),
              ),
            );

          },
        ),
      );
  }
}



class PaymentHistoryTab extends StatelessWidget {
  Widget paymentTile(String title, String transactionId, String time, String date, String status) {
    return Column(
      children: [
        ListTile(
          leading: GifView.asset(
            'assets/history.gif',
            height: 51.h,
            width: 47.h,
            frameRate: 30,
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 5),
            child: GradientText(text: title,fontWeight: FontWeight.bold,fontSize:13.sp),
          ),
          subtitle: Text("Transaction ID: $transactionId\n$date", style: GoogleFonts.inriaSans(color: Colors.white,fontWeight: FontWeight.w400)),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(time, style: TextStyle(color: Colors.white)),
              SizedBox(height: 5),
              Container(
                height: 20,
                width: 60,
                child: Center(
                  child: Text(status == "Paid" ? 'Paid':'Failed',style: TextStyle(
                    color: status == 'Paid'? Colors.green : Colors.red
                  ),),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: status == 'Paid'? Colors.green : Colors.red
                  )
                ),
              )
            ],
          ),
        ),
        GradientDivider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        paymentTile("November Month Chit Amount", "2589654123", "03:43 PM", "06/11/2024", "Paid"),
        paymentTile("October Month Chit Amount", "2589652132", "01:13 PM", "06/10/2024", "Paid"),
        paymentTile("October Month Chit Amount", "2589652130", "01:10 PM", "06/10/2024", "Failed"),
        paymentTile("September Month Chit Amount", "2589652132", "02:56 PM", "03/09/2024", "Paid"),
      ],
    );
  }
}


class GradientDivider extends StatelessWidget {
  final List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradients,
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(bounds),
      child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Container(
          height: 0.50,
          width: double.infinity,
          color: Colors.white,
        ),
      ),
    );
  }
}