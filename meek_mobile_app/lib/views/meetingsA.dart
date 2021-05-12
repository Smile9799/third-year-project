import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/tracknew.dart';

import '../constans.dart';
import 'login.dart';



class SeeMeeting1 extends StatefulWidget {
  // ignore: non_constant_identifier_names
  SeeMeeting1({this.UserIDD});
  final String UserIDD;
  @override
  SeeMeeting1State createState() => SeeMeeting1State();
}

class SeeMeeting1State extends State<SeeMeeting1> {

  Map data;
  List userData;

  Future getData() async {
    print(UserId);

    http.Response response = await http.post(GetMeetingDetails,body: {
      "PitchID":'1'
    });
//    print(UserId);
    String InnovatorId = '';
    var datauser2 = json.decode(response.body);
    print(datauser2);
//    InnovatorId= datauser2[0]['InnovatorId'];
//    print(InnovatorId);


//    http.Response response = await http.post("http://10.254.165.49/meekdbapi/getpitch.php", body: {
//      "InnovatorID":InnovatorId,
//    });

//    http.Response response2 = await http.get("https://reqres.in/api/users?page=2");
    userData = json.decode(response.body);
    UserIDD = userData[0]['InnovatorId'];
    print(userData);
    setState(() {
//        userData;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

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
          title: Text("         Scheduled Meetings ",
            style: TextStyle(
                color: Colors.white
            ),),
        ),
        body:SafeArea(
          child: ListView.builder(
              itemCount: userData == null ? 0 : userData.length,
              itemBuilder: (BuildContext context, int index) {
                return Wrap(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.date_range, size: 30,),

                            Text("  Meeting Date:  ", style: TextStyle(fontSize: 20),),
                            Column(
                              children: [
                                Text("  ${userData[index]["InterviewDate"]}", style: TextStyle(fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),),

                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 20,),

                        Row(children: [
                          SizedBox(width:30,),

                          Column(
                            children: [
                              SizedBox(width: 40,),
                              Icon(Icons.edit_location, size: 30, color: Colors.black,),

                              Text(
                                "     Meeting Room:  ", style: TextStyle(fontSize: 13),),
                              Column(
                                children: [
                                  Text("  ${userData[index]["InterviewRoom"]}", style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),),

                                ],
                              ),

                            ],
                          ),

                          Column(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.code, size: 30, color: Colors.black,),

                              Text(
                                "     Meeting Time:  ", style: TextStyle(fontSize: 13),),
                              Column(
                                children: [
                                  Text("  ${userData[index]["InterviewTime"]}", style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),),

                                ],
                              ),

                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(width: 40,),
                              Icon(Icons.edit_location, size: 30, color: Colors.black,),

                              Text(
                                "     Meeting Venue:  ", style: TextStyle(fontSize: 13),),
                              Column(
                                children: [
                                  Text("  ${userData[index]["InterviewVenue"]}", style: TextStyle(fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),),

                                ],
                              ),

                            ],
                          ),
                        ],),
                        SizedBox(height: 20,),

//              Row(
//                children: [
//
//                  Icon(FlutterIcons.location_arrow_faw, size: 30,),
//
//                  Text("  Adress:  ", style: TextStyle(fontSize: 20),),
//                  Column(
//                    children: [
//                      Text("  Johannesburg", style: TextStyle(fontSize: 20,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.green),),
//
//                    ],
//                  ),
//
//                ],
//              ),
//              SizedBox(height: 20,),

                        Container(
                          color: Colors.white70,
                          child:
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(FlutterIcons.message1_ant, size: 20,
                                            color: Colors.black),
                                        Text(
                                            "  Message from investor  ",
                                            style: TextStyle(fontSize: 20,
                                                color: Colors.black)),

                                      ],
                                    ),
                                    SizedBox(height: 20,),
                                    Text("  ${userData[index]["InvestorMessage"]}",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.black),),


                                  ],
                                ),
                              ],
                            ),
                          ),


                        ),
                      ],
                    ),
                  ],
                );
              }
          ),
        )
    );
  }
}
