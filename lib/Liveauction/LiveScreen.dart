import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import 'dart:async';




class Livescreen extends StatefulWidget {
  const Livescreen({super.key});

  @override
  State<Livescreen> createState() => _LivescreenState();
}

class _LivescreenState extends State<Livescreen> {

  bool _isColumnVisible = true;
  bool _dialogShown = false;


  late int _minutes;
  late int _seconds;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    _minutes = 1;
    _seconds = 36;


    _startTimer();
  }


  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {

      if(_minutes == 0){
        _timer.cancel();
      }
      if (_seconds == 20) {
        if (_minutes == 1) {
          _showAlertDialog();
          _minutes = 1;
          _seconds = 20;


        } else {
          _minutes--;
          _seconds = 59;
        }
      } else {
        _seconds--;
      }


      setState(() {});
    });
  }


  void _showAlertDialog() {
    if (!_dialogShown) {
      setState(() {
        _dialogShown = true;
      });

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.watch_later, color: Colors.red, size: 80),
                SizedBox(height: 10),
                Text(
                  "Bidding Close Soon! 0:59 sec",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: GradientColoredButton(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {},
                    child: FlutterCustomText(
                      text: 'Bid Now',
                      color: AppColors().blackColor,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }



  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Live Auction',style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
        actions: [Image(image: AssetImage("assets/whatsapp.png")),
          Icon(Icons.notification_add,color: Colors.white,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(children: [
          GradientText(text: '$_minutes:${_seconds.toString().padLeft(2, '0')} Min'),
          SizedBox(height: 20.h,),
          Container(
            width: double.infinity.w,
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("January Month Chit",style: TextStyle(color: Colors.white),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GradientText(text: '₹ 10,00,000'),
                ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 200.h,
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Image(image: AssetImage('assets/manemoji.png')),
                                  Column(children: [
                                    Text("Token No",style: TextStyle(color: Colors.white),),
                                    GradientText(text: "SSC 901")
                                  ],),
                                  Column(children: [
                                    Text("Bid value",style: TextStyle(color: Colors.white),),
                                    GradientText(text: "₹ 10,00,000")
                                  ],)
                                ],
                              ),
                              Divider(
                                endIndent: 30,
                                indent: 30,
                              ),

                            ],
                          ),
                        );

                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  if (_isColumnVisible)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Ongoing Bidding Value",style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    SizedBox(height: 34,width: 150,
                      child: GradientColoredButton(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {},
                        child: FlutterCustomText(
                          text: '₹ 5,00,000',
                          color: AppColors().blackColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text("Enter Your Bid",style: TextStyle(color: Colors.white),),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 40.h,
                          width: 150.w,
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: GradientIcon(child: Icon(Icons.currency_rupee,color: Colors.white,size: 15,))
                            ),
                          ),
                        ),
                        SizedBox(height: 40.h,width: 100.w,
                          child: GradientColoredButton(
                            borderRadius: BorderRadius.circular(5),
                            onTap: () {},
                            child: FlutterCustomText(
                              text: 'Bid',
                              color: AppColors().blackColor,
                            ),
                          ),
                        ),

                      ],
                    ),
                      SizedBox(height: 10,),

                    Center(
                      child: SizedBox(height: 34.h,width: 200.w,
                        child: GradientColoredButton(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () {
                            setState(() {
                              _isColumnVisible = false;
                            });
                          },
                          child: FlutterCustomText(
                            text: 'CALL OFF',
                            color: AppColors().blackColor,
                          ),
                        ),
                      ),
                    ),
                      SizedBox(height: 20,)
                  ],)




              ],),
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white
              )
            ),
          ),

        ],),
      ),
    );
  }
}

