import 'package:backbone/MyChit/PaymentPage.dart';
import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constant/app_colors.dart';
import '../login/bottom_navigation/bottom_navigation_screen.dart';
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
      setState(() {
        if (_minutes == 0 && _seconds == 0) {
          timer.cancel();
          _goToNextScreen();
        } else if (_seconds == 0) {
          _minutes--;
          _seconds = 59;
        } else {
          _seconds--;
        }

        if (_minutes == 1 && _seconds == 20) {
          _showAlertDialog();
        }
      });
    });
  }
  void _goToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => TimeupScreen()),
    );
  }

  void _resetTimer() {
    _timer.cancel();
    setState(() {
      _minutes = 1;
      _seconds = 36;
      _dialogShown = false;
    });

    _startTimer();
  }


  void _showAlertDialog() {
    if (!_dialogShown && _isColumnVisible) {
      _dialogShown = true;

      Timer? modalTimer;

      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setModalState) {
              modalTimer ??= Timer.periodic(Duration(seconds: 1), (timer) {
                setModalState(() {});
              });
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.watch_later, color: Colors.red, size: 80),
                    SizedBox(height: 10),
                    Text(
                      "Bidding Closes In: $_minutes:${_seconds.toString().padLeft(2, '0')} sec",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: 50,
                      child: GradientColoredButton(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          modalTimer?.cancel();
                          Navigator.pop(context);
                          _resetTimer();
                        },
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
        },
      ).whenComplete(() {

        modalTimer?.cancel();
      });
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
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
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
                              )
                            ],
                          ),
                        );

                      },
                    ),
                  ),
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
                            onTap: () {
                              _resetTimer();
                            },
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
                              _dialogShown = true;
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





class TimeupScreen extends StatefulWidget {
  @override
  _TimeupScreenState createState() => _TimeupScreenState();
}

class _TimeupScreenState extends State<TimeupScreen>
    with TickerProviderStateMixin {
  late AnimationController _iconController;
  late AnimationController _textController;
  late AnimationController _buttonController;

  late Animation<double> _iconScaleAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _buttonFadeAnimation;



  @override
  void initState() {
    super.initState();

    _iconController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );

    _textController = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );

    _buttonController = AnimationController(
      duration: Duration(milliseconds: 1200),
      vsync: this,
    );

    _iconScaleAnimation = CurvedAnimation(
      parent: _iconController,
      curve: Curves.elasticOut,
    );

    _textSlideAnimation = Tween<Offset>(
      begin: Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _textController,
        curve: Curves.easeOut,
      ),
    );

    _buttonFadeAnimation = CurvedAnimation(
      parent: _buttonController,
      curve: Curves.easeIn,
    );

    _iconController.forward();
    Future.delayed(Duration(milliseconds: 400), () => _textController.forward());
    Future.delayed(Duration(milliseconds: 800), () => _buttonController.forward());


    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Bottom_Navigation()),
      );
    });
  }



  @override
  void dispose() {
    _iconController.dispose();
    _textController.dispose();
    _buttonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _iconScaleAnimation,
                child: Icon(
                  Icons.alarm,
                  color: Colors.green,
                  size: 120,
                ),
              ),
              SizedBox(height: 20),
              SlideTransition(
                position: _textSlideAnimation,
                child: Column(
                  children: [
                    GradientText(text: "Time UP ",fontSize: 30,),
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

