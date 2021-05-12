import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/viewpitchpage.dart';
import 'package:meek_mobile_app/viewpitchpage2.dart';
import 'package:meek_mobile_app/views/login.dart';
import 'package:meek_mobile_app/views/pitch_offers.dart';
import 'package:meek_mobile_app/views/track.dart';
import 'package:meek_mobile_app/views/view_offer_details.dart';
import 'package:meek_mobile_app/views/view_offer_details2.dart';
import 'dart:async';
import 'dart:convert';

import '../Tracknew2.dart';
import '../addbid1.dart';
import '../constans.dart';

String UserIDD;
class calendarPage3 extends StatefulWidget {
  calendarPage3({this.UserId});
  final String UserId;
  @override
  calendarPage3State createState() => calendarPage3State();
}

class calendarPage3State extends State<calendarPage3> {

  Map data;
  List userData;

  Future getData() async {
    print(UserId);

    http.Response response = await http.post(GetBidDetails,body: {
      "pitchId":"1",

    });
    String InnovatorId = '';
    var datauser2 = json.decode(response.body);
    print(datauser2);
//
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
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),
        backgroundColor: Colors.grey[50],
        title: Text("                All Bids",
          style: TextStyle(
              color: Colors.black
          ),),
      ),
      body:
      GestureDetector(
        onTap: (){
//          Navigator.push(context, MaterialPageRoute(
//            //builder: (context)=>ViewPitchPage(UserIDD: UserIDD)));
//              builder: (context)=>PitchOffer()));
        },
        child: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Wrap(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    color: Colors.grey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Investor: ${userData[index]["InvestorUserID"]}", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,fontSize: 17
                        ),),
                        SizedBox(height: 10,),
                        Text(' Pitch Title: ${userData[index]["pitchId"]}', style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500
                        ),),
                        SizedBox(height: 5,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
//                    Icon(Icons.timer, color: Colors.lightBlueAccent,),
                            SizedBox(width: 5,),
                            Text('Message from investor: ${userData[index]["InvestorMessage"]} ', style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13,
                                fontWeight: FontWeight.w600
                            ),),

                          ],
                        ),
                        SizedBox(height: 5,),
//                Row(
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: [
//                    Icon(Icons.calendar_today,color: Colors.lightBlueAccent,),
//                    SizedBox(width: 5,),
//                    Text("Date", style: TextStyle(
//                        color: Colors.grey,
//                        fontWeight: FontWeight.w500
//                    ),),
//                  ],
//                ),
                        SizedBox(height: 5,),
                        Container(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.black,),
                            Expanded(
                              child: Container(),
                            ),
                            Text("R${userData[index]["Investorfunds"]}", style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.swap_horiz, color: Colors.blue,),
                            Expanded(
                              child: Container(),
                            ),
                            Text("${userData[index]["Investorpercentage"]}%", style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        Row(
                          children: [
//                    Icon(Icons.check, color: Colors.green,),
//                    Text("Accept", style: TextStyle(
//                        color: Colors.green,
//                        fontSize: 16,
//                        fontWeight: FontWeight.w600
//                    ),),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
//
                                FlatButton.icon(onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => AddBid1()),
                                  );
                                }, icon: Icon(FontAwesomeIcons.undoAlt,color: Colors.green,) , label: Text("Place reverse bid", style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),)

//
                              ],
                            ),

                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
//
                                FlatButton.icon(onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => TrackNew2()),
                                  );
                                }, icon: Icon(FontAwesomeIcons.ban,color: Colors.red,) , label: Text("Go back", style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),)

//
                              ],
                            ),
//                    Expanded(
//                      child: Container(),
//                    ),
//                    Icon(Icons.cancel, color: Colors.red,),
//                    Text("Reject", style: TextStyle(
//                        color: Colors.red,
//                        fontSize: 16,
//                        fontWeight: FontWeight.w600
//                    ),)
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.all(20),
                    color: Colors.grey[100],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Innovator:", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,fontSize: 17
                        ),),

                        SizedBox(height: 10,),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
//                    Icon(Icons.timer, color: Colors.lightBlueAccent,),
                            SizedBox(width: 5,),
                            Column(
                              children: [
                                Text('Message from innovator: ', style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600
                                ),),

                              ],
                            ),

                          ],
                        ),
                        Container(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on, color: Colors.black,),
                            Expanded(
                              child: Container(),
                            ),
                            Text("R5000", style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),

                        Row(
                          children: [
                            Icon(Icons.swap_horiz, color: Colors.blue,),
                            Expanded(
                              child: Container(),
                            ),
                            Text("25%", style: TextStyle(
                                color: Colors.blue,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                            ),)
                          ],
                        ),
                        Row(
                          children: [
//                    Icon(Icons.check, color: Colors.green,),
//                    Text("Accept", style: TextStyle(
//                        color: Colors.green,
//                        fontSize: 16,
//                        fontWeight: FontWeight.w600
//                    ),),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
//
                                FlatButton.icon(onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ViewPitchPage()),
                                  );
                                }, icon: Icon(Icons.check,color: Colors.green,) , label: Text("Accept", style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),)

//
                              ],
                            ),
                            SizedBox(
                              height: 15,width:80,
                            ),
                            ButtonBar(
                              alignment: MainAxisAlignment.start,
                              children: [
//
                                FlatButton.icon(onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => ViewPitchPage()),
                                  );
                                }, icon: Icon(Icons.cancel,color: Colors.red,) , label: Text("Reject", style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600
                                ),),)

//
                              ],
                            ),
//                    Expanded(
//                      child: Container(),
//                    ),
//                    Icon(Icons.cancel, color: Colors.red,),
//                    Text("Reject", style: TextStyle(
//                        color: Colors.red,
//                        fontSize: 16,
//                        fontWeight: FontWeight.w600
//                    ),)
                          ],
                        )
                      ],
                    ),
                  ),
                )
                // Column(
                //
                //   children: [
                //     Text("PitchName:${userData[index]["PitchName"]}\n ",
                //       style: TextStyle(
                //         fontSize: 20.0,
                //         fontWeight: FontWeight.w700,
                //       ),),
                //     new Icon(Icons.location_on),
                //     Text(":R${userData[index]["Budget"]}",style:
                //     new
                //     TextStyle
                //       (fontSize: 30.0))
                //
                //   ],
                // ),
              ],
            );
          },
        ),
      ),

    );
  }
}
