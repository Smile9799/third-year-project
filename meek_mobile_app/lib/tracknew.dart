import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/viewpitchpage.dart';
import 'package:meek_mobile_app/views/login.dart';
import 'package:meek_mobile_app/views/pitch_offers.dart';
import 'package:meek_mobile_app/views/track.dart';
import 'package:meek_mobile_app/views/view_offer_details.dart';
import 'package:meek_mobile_app/views/view_offer_details2.dart';
import 'dart:async';
import 'dart:convert';

import 'constans.dart';

String UserIDD;
class TrackNew extends StatefulWidget {
  TrackNew({this.UserId});
  final String UserId;
  @override
  TrackNewState createState() => TrackNewState();
}

class TrackNewState extends State<TrackNew> {

  Map data;
  List userData;

  Future getData() async {
    print(UserId);

    http.Response response = await http.post(GetUserPitch,body: {
      "id":UserId
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
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),
        backgroundColor: Colors.grey[50],
        title: Text("                All Pitches",
          style: TextStyle(
              color: Colors.black
          ),),
      ),
      body:
      GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              //builder: (context)=>ViewPitchPage(UserIDD: UserIDD)));
              builder: (context)=>PitchOffer()));
        },
        child: ListView.builder(
          itemCount: userData == null ? 0 : userData.length,
          itemBuilder: (BuildContext context, int index) {
            return Wrap(
              children: [
                Card(
                  color: Colors.grey[50],
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("  ${userData[index]["PitchName"]}",style: new TextStyle
                                  (fontSize:
                                30.0,fontWeight: FontWeight.bold,color: Colors.lightBlue),
                                    textAlign:TextAlign.center),
                                Spacer(),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:4.0,bottom: 15.0),
                          child: Row(children: <Widget>[
                            new Icon(Icons.category),
                            Text("  ${userData[index]["Industry"]}",style:
                            new TextStyle(fontSize: 15.0)),
                            Spacer(),
                            new Icon(Icons.monetization_on),
                            Text(" R${userData[index]["Budget"]}",style:
                            new
                            TextStyle
                              (fontSize: 20.0,color: Colors.green))
                          ]),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                          child: Row(
                            children: <Widget>[
                              new Icon(Icons.location_city),
                              Text("  ${userData[index]["ManagementLocation"]}",
                                  style:new TextStyle(fontSize:15.0, color: Colors.black)),
                              Spacer(),
                              Column(
                                children: [
                                  ButtonBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
//
                                      FlatButton.icon(onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => ViewPitchPage()),
                                        );
                                      }, icon: Icon(FontAwesomeIcons.arrowCircleRight,color: Colors.blue,) , label:Text("VIEW FULL PITCH",style: TextStyle(color: Colors.blue),))

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
                                          MaterialPageRoute(builder: (context) => calendarPage2()),
                                        );
                                      }, icon: Icon(FontAwesomeIcons.arrowCircleRight,color: Colors.blue,) , label:Text("VIEW PITCH OFFERS",style: TextStyle(color: Colors.blue),))

//
                                    ],
                                  ),
                                ],
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
