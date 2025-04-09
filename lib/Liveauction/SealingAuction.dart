import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';

import '../constant/app_colors.dart';
import '../utils/flutter_custom_text.dart';
import '../utils/gradient_coloured_button.dart';


class Sealingauction extends StatefulWidget {
  const Sealingauction({super.key});

  @override
  State<Sealingauction> createState() => _SealingauctionState();
}

class _SealingauctionState extends State<Sealingauction> {

  List<Color> gradients = [
    Color(0xFFBF9347),
    Color(0xFFFBF398),
    Color(0xFFF0D571),
    Color(0xFFF9F194),
    Color(0xFFDEAB3D),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Sealing Auction',style: TextStyle(color: Colors.white),),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        actions: [Image(image: AssetImage("assets/whatsapp.png")),
          Icon(Icons.notification_add,color: Colors.white,)
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
          GradientText(text: "Upcoming Auctions"),
          Text("19/12/2024",style: TextStyle(color: Colors.white),),
            SizedBox(height: 20,),

            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Live Auction Room Starts at",style: TextStyle(color: Colors.white),),
                                GradientText(text: '02:30 PM'),
                                Text("January Month Chit",style: TextStyle(color: Colors.white),),
                                GradientText(text: '₹ 10,00,000'),

                              ],),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(height: 34,width: 100,
                                  child: GradientColoredButton(
                                    borderRadius: BorderRadius.circular(30),
                                    onTap: () {},
                                    child: FlutterCustomText(
                                      text: 'Join',
                                      color: AppColors().blackColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],)
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              color: Colors.white

                          )

                      ),
                    ),
                  );

                },
              ),
            ),

        ],),
      ) ,
    );
  }
}
