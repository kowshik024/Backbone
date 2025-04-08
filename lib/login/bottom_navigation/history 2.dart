import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/utils/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



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


class ChitHistoryTab extends StatelessWidget {
  Widget chitCard(String month, String chitValue, String totalInst, String status, String date) {
    return ListView.builder(itemBuilder: (context , index){});
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        chitCard("May -2023", "₹100,000", "25/25", "completed", "12/06/2023"),
        chitCard("June -2023", "₹100,000", "20/20", "completed", "10/03/2022"),
      ],
    );
  }
}


class PaymentHistoryTab extends StatelessWidget {
  Widget paymentTile(String title, String transactionId, String time, String date, String status) {
    return ListTile(
      leading: Icon(Icons.receipt, color: Colors.grey),
      title: Text(title, style: TextStyle(color: Colors.white)),
      subtitle: Text("Transaction ID: $transactionId\n$date", style: TextStyle(color: Colors.white70)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(time, style: TextStyle(color: Colors.white)),
          SizedBox(height: 5),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: status == "Paid" ? Colors.green : Colors.red,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(status, style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
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