import 'package:backbone/constant/app_colors.dart';
import 'package:backbone/login/welcome_screen.dart';
import 'package:backbone/utils/flutter_custom_text.dart';
import 'package:backbone/utils/gradient_coloured_button.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login_screen.dart';

class Walkthrough_Screen extends StatefulWidget {
  @override
  _Walkthrough_ScreenState createState() => _Walkthrough_ScreenState();
}

class _Walkthrough_ScreenState extends State<Walkthrough_Screen> {
  int currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      'title': 'Trusted and reliable',
      'description': 'We have a strong reputation for transparency reliability in the chit funds industry, ensuring your money is safe and well managed.'
    },
    {
      'title': 'Flexible Plans',
      'description': 'We offer a variety of chit schemes tailored to different financial needs whether your saving for personal goals, business investment or emergencies.'
    },
    {
      'title': 'High Returns and Low risk (doubt)',
      'description': 'Unlike traditional saving options chit fund provide access to lump sum amount while maintain financial discipline with competitive returns compare to banks'
    },
  ];

  void _nextContent() {
    if (currentIndex < pages.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login_Screen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = currentIndex == pages.length - 1;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Stack(
            children: [
              Positioned(
                right: 10,
                top: 10,
                child: Visibility(
                  visible: currentIndex == 0,
                  child: GradientColoredButton(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Welcome_Screen()));
                    },
                    child: FlutterCustomText(
                      text: 'Skip >',
                      fontSize: 12,
                      color: AppColors().blackColor,
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: Text(
                      pages[currentIndex]['title']!,
                      key: ValueKey(pages[currentIndex]['title']),
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inriaSans(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 0,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 300),
                    child: GradientText(
                      key: ValueKey(pages[currentIndex]['description']),
                      text: pages[currentIndex]['description']!,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 40),
                  SmoothPageIndicator(
                    controller: PageController(initialPage: currentIndex),
                    count: pages.length,
                    effect: ExpandingDotsEffect(
                      activeDotColor: Color(0xFFF5CB54),
                      dotColor: Colors.white24,
                      dotHeight: 8,
                      dotWidth: 8,
                      spacing: 6,
                      paintStyle: PaintingStyle.fill,
                      radius: 10,
                    ),
                    onDotClicked: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    height: 44,
                    width: 260,
                    child: GradientColoredButton(
                      onTap: _nextContent,
                      child: FlutterCustomText(
                        text: 'Next',
                        color: AppColors().blackColor,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
