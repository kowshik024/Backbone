import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/login/login_screen.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class Walkthrough_Screen extends StatefulWidget {
  @override
  _Walkthrough_ScreenState createState() => _Walkthrough_ScreenState();
}

class _Walkthrough_ScreenState extends State<Walkthrough_Screen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  final List<Map<String, String>> pages = [
    {
      'title': '“TRUSTED BY 1500+ HAPPY CLIENTS!”',
      'description': 'Over 1500 Happy Clients Trust Us To Deliver Seamless And Exceptional Experiences. Join Them And Achieve Your Goals With Ease!'
    },
    {
      'title': '“37 YEARS OF INDUSTRY EXPERIENCE!”',
      'description': 'With 37 Years Of Industry Experience, We Bring Unmatched Expertise And A Proven Track Record Of Success. Our Long-Standing Commitment To Excellence Ensures Innovative Solutions And Exceptional Results, Making Us A Trusted Leader In The Field.'
    },
    {
      'title': '“100+ NO. OF CHIT SCHEMES!”',
      'description': 'With 100+ Successful Chit Schemes, We Offer Reliable And Secure Financial Solutions, Helping Customers Achieve Their Goals With Trust And Transparency.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: _controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == pages.length - 1;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        pages[index]['title']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 16),
                      Padding(
                        padding:  EdgeInsets.only(left:16.w),
                        child: GradientText(text: pages[index]['description']!,textAlign: TextAlign.center,),
                      ),
                      SizedBox(height: 40),
                      SmoothPageIndicator(
                        controller: _controller,
                        count: pages.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: Color(0xffF5CB54),
                          dotColor: Colors.white24,
                          dotHeight: 8,
                          dotWidth: 8,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 44,width: 260,
                        child: GradientColoredButton(
                          onTap: () {
                            if (isLastPage) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Screen()));
                            } else {
                              _controller.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child: FlutterCustomText(
                            text: 'Next',
                            color: AppColors().blackColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              right: 20,
              top: 20,
              child: Visibility(
                visible: !isLastPage,
                child: GradientColoredButton(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login_Screen()));
                  },
                  child: FlutterCustomText(
                    text: 'Skip >',
                    fontSize: 14.sp,
                    color: AppColors().blackColor,
                  ),
                ),
                // TextButton(
                //   onPressed: () {
                //     _controller.jumpToPage(pages.length - 1);
                //   },
                //   child: Text(
                //     'SKIP',
                //     style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold),
                //   ),
                // ),
              //  
              ),
            )
          ],
        ),
      ),
    );
  }
}