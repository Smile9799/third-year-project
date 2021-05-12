import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/tracknew.dart';




class SeeBid1 extends StatefulWidget {
  // ignore: non_constant_identifier_names
  SeeBid1({this.UserIDD});
  final String UserIDD;
  @override
  SeeBid1State createState() => SeeBid1State();
}

class SeeBid1State extends State<SeeBid1> {

  @override

  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          //change your color here
        ),
        backgroundColor: Colors.lightBlue,
        title: Text("Bidding Table ",
          style: TextStyle(
              color: Colors.white
          ),),
      ),
      body:SafeArea(
        child: ListView(
          children: [
            Flexible(
              child: Container(

              child: Column(
                children: [
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Column(
                        children: [
                         Icon(FontAwesomeIcons.moneyCheckAlt),
                          Text("Investor Funds", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Text("R100 000", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.green),),

                        ],

                      ),
                      SizedBox(width: 40,),

                      Column(
                        children: [
                          Icon(FontAwesomeIcons.funnelDollar),
                          Text("Investor Percentage", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Text("67%", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.green),),

                        ],

                      ),
                    ],
                  ),
                  SizedBox(height: 40,),

                  Row(
                    children: [
                      SizedBox(width: 40,),
                      Column(
                        children: [
                          Icon(FontAwesomeIcons.moneyBill),
                          Text("Innovator Funds", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Text("R100 000", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.green),),

                        ],

                      ),
                      SizedBox(width: 40,),

                      Column(
                        children: [
                          Icon(FontAwesomeIcons.funnelDollar),
                          Text("Innovator Percentage", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          Text("67%", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.green),),

                        ],

                      ),
                    ],
                  ),
                  SizedBox(height: 40,),

                  Container(
                    color: Colors.blue[900],
                    child: Row(
                      children: [
                        SizedBox(width: 85,),

                        Column(
                          children: [
                            SizedBox(height: 10,),
                            Center(
                                child: Icon(FontAwesomeIcons.commentDollar,color: Colors.white,)),
                            Text("    Investor Message", style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("I look forward to working with you", style: TextStyle(fontSize: 13,color: Colors.white)),

                          ],

                        ),
                        SizedBox(height: 40,),

                        SizedBox(height: 40,),
                      ],
                    ),
                  ),


                  Container(

                    color: Colors.blue[900],

                    child: Row(
                      children: [
                        SizedBox(width: 80,),
                        Column(
                          children: [
                            SizedBox(height: 10,),
                            Center(
                                child: Icon(FontAwesomeIcons.commentDollar,color: Colors.white,)),
                            Text("     Innovator Message", style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
                            Text("I look forward to working  with you too", style: TextStyle(fontSize: 13,color: Colors.white),),
                            SizedBox(height: 20,),

                          ],

                        ),
                        SizedBox(width: 40,),


                      ],
                    ),
                  ),
                ],
              ),

          ),
            ),
          ],
        ),
      ),
    );
  }
}
