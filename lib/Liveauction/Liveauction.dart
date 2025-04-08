import 'package:backbone/utils/gradient_icon.dart';
import 'package:backbone/utils/gradient_text.dart';
import 'package:flutter/material.dart';

class Liveauction extends StatefulWidget {
  const Liveauction({super.key});

  @override
  State<Liveauction> createState() => _LiveauctionState();
}

class _LiveauctionState extends State<Liveauction> {


  List<String> Options =[
    'Sealing Auction',
    'Bidding Auction',
  ];

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
        title: Text('Live Auction',style: TextStyle(color: Colors.white),),
        leading: Icon(Icons.menu,color: Colors.white,),
        actions: [Image(image: AssetImage("assets/whatsapp.png")),
        Icon(Icons.notification_add,color: Colors.white,)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
          GradientText(text: "Auction You Wish To Join"),
        SizedBox(height: 30,),

            SizedBox(
              height: 150,
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return
                    Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: gradients,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  Options[index],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientIcon(child: Icon(Icons.arrow_forward_ios,color: Colors.white,)),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),


        ],),
      ),
    );
  }
}
