import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meek_mobile_app/constans.dart';
import 'package:meek_mobile_app/model/pitch.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/views/view_offer_details.dart';
import 'login.dart';

class PitchOffer extends StatefulWidget {
  @override
  _PitchOfferState createState() => _PitchOfferState();
}

class _PitchOfferState extends State<PitchOffer> {
  Map data;
  List<dynamic> responseData;
  
  Future getResponses() async{
    http.Response response = await http.post(GetPitchProgress,body: {
      "PitchID":"1"
    });
    responseData = json.decode(response.body);
    print(responseData[0]["TextMessage"]);
  }
  @override
  void initState() {
    super.initState();
    getResponses();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: new AppBar(
        centerTitle: true,
        title: Text("Offers and Responses"),
      ),
      body: Column(
        children:<Widget> [
          Column(
            children:<Widget> [
              Container(
                alignment: Alignment.topLeft,
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width*0.8,
                  ),
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      )
                    ]
                  ),
                    child:Text(""),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(builder: (context)=>calendarPage()));
            },
            child: Column(
              children:<Widget> [
                Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width*0.8,
                    ),
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                          )
                        ]
                    ),
                    child:Text("Hi there we have received your pitch our "
                        "reviewes will look at it before passing it to our "
                        "investors",style: new TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}