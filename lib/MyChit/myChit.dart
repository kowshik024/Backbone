import 'package:backbone/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:backbone/constant/app_images.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';
import '../utils/gradient_text.dart';



class Mychit extends StatefulWidget {
  const Mychit({super.key});

  @override
  State<Mychit> createState() => _MychitState();
}

class _MychitState extends State<Mychit> {

  bool _isDownloading = false;

  List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];


  List<String> chitNames =[
    "Chit A",
    "Chit B",
    "Chit C",
    "Chit D",
    "Chit E",
    "Chit F",
    "Chit G",
  ];
  List<bool> _checkboxStates = [false];
  @override
  void initState() {
    super.initState();
    _checkboxStates = List<bool>.filled(chitNames.length, false);
  }

  void _toggleCheckbox(int index) {
    setState(() {
      _checkboxStates[index] = !_checkboxStates[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(children: [
          Text("2 Chit selected",style: TextStyle(color: Colors.white),),
        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Total Chit Overview:",style: TextStyle(color: Colors.white,fontSize: 18),),
            Padding(
              padding: const EdgeInsets.only(right: 50),
              child: GradientText(text: '₹ 3540'),
            ),
            SizedBox(height: 34,width: 100,
              child: GradientColoredButton(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: FlutterCustomText(
                  text: 'Pay',
                  color: AppColors().blackColor,
                ),
              ),
            ),
        
        
        
          ],),
          SizedBox(height: 20,),
        
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ExpansionTile(
                title: GradientText(text: "Current Chit Overview"),
                children: [
                  Container(
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4.0,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/person.png'),
                    ),
                  ),
          
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("Name:", style: TextStyle(color: Colors.white)),
                        GradientText(text: "Nandha Kumar"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("User ID:", style: TextStyle(color: Colors.white)),
                        GradientText(text: "SSC123"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          width: double.infinity,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradients,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Chit Overview"),
                          ),
                        ),
                        Container(
                          width: double.infinity, // Responsive width
                          height: 230,
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Chit Value", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "₹ 10,00,000"),
                                  Text("Priced Chit Value", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "₹ 12,00,000"),
                                  GradientText(text: "Loans"),
                                  Text("₹ 1,00,000", style: TextStyle(color: Colors.white)),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("UnPriced Chit Value", style: TextStyle(color: Colors.white)),
                                  GradientText(text: "₹ 12,00,000"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        
          SizedBox(height: 30,),
          Expanded(
            child: ListView.builder(
              itemCount: chitNames.length,
              itemBuilder: (context, index) {
                return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Container(
                        height: 50,
                        width:320 ,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () => _toggleCheckbox(index),
                                child: Icon(
                                  _checkboxStates[index] ? Icons.check_box : Icons.check_box_outline_blank,                              ),
                              ),
                              Text(chitNames[index]),
                              SizedBox(width: 70,),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isDownloading = !_isDownloading;
                                  });
                                },
                                child: Icon(
                                  _isDownloading ? Icons.download_done : Icons.download,
        
                                ),
                              ),
        
                            ],),
                        ),
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
                        width: 320,
                        height: 230,
                        child:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Chit Value",style: TextStyle(color: Colors.white),),
                                GradientText(text: "₹ 1,00,000"),
                                Text("Total Inst",style: TextStyle(color: Colors.white),),
                                GradientText(text: "25"),
                                Text("Auction Details",style: TextStyle(color: Colors.white),),
                                GradientText(text: "12/06/2025"),
                                Text("₹ 1,00,000",style: TextStyle(color: Colors.white),),
        
                              ],),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Paid",style: TextStyle(color: Colors.white),),
                                GradientText(text: "12/25"),
                                Text("Status",style: TextStyle(color: Colors.white),),
                                GradientText(text: "NPS"),
                                Text("Current Bal",style: TextStyle(color: Colors.white),),
                                GradientText(text: "₹ 45,000"),
                               ElevatedButton(style: ElevatedButton.styleFrom(
                               ),
                                   onPressed: (){}, child: Text("Pay"))
        
        
                              ],),
                          ],),
        
        
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)
                            ),
                            border: Border.all(
                                color: Colors.white
                            )
                        ),
                      ),
        
        
                    ],),
                  );
        
              },
            ),
          ),
        
        
        ],
        ),
      ),
    );
  }
}
