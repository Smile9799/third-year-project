import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meek_mobile_app/constans.dart';
import 'package:meek_mobile_app/model/pitch.dart';
import 'package:meek_mobile_app/viewpitchpage.dart';
import 'package:meek_mobile_app/views/pitch_offers.dart';
import 'package:meek_mobile_app/widgets/bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

class TrackPitch extends StatefulWidget {
  @override
  _TrackPitchState createState() => _TrackPitchState();
}

class _TrackPitchState extends State<TrackPitch> {
  List pitchData;
  Future getPitchForInnovator() async {
    http.Response response = await http.post(GetUserPitch,body: {
      "id":"1"
    });
    pitchData = json.decode(response.body);
    print(pitchData);
  }
  @override
  void initState() {
    super.initState();
   getPitchForInnovator();
  }
  Widget buildCardView(BuildContext context, int index) {
    return new Container(
      child: new GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>PitchOffer()));
        },
        child: Card(
          color: Colors.lightBlue,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 10.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(pitchData[index]["PitchName"],style: new TextStyle
                          (fontSize:
                        30.0),
                            textAlign:TextAlign.center),
                        Spacer(),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4.0,bottom: 15.0),
                  child: Row(children: <Widget>[
                    new Icon(Icons.category),
                    Text("${pitchData[index]["Industry"]}",style:
                    new TextStyle(fontSize: 20.0)),
                    Spacer(),
                  ]),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                //   child: Row(children: <Widget>[
                //     new Icon(Icons.location_city),
                //     Text(":"+ pitch.location,style: new TextStyle(fontSize:
                //     20.0)),
                //     Spacer(),
                //   ]),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                  child: Row(
                    children: <Widget>[
                      new Icon(Icons.location_city),
                      Text("${pitchData[index]["ManagementLocation"]}",
                          style:new TextStyle(fontSize:20.0)),
                      Spacer(),
                      new Icon(Icons.location_on),
                      Text(":R${pitchData[index]["Budget"]}",style:
                      new
                      TextStyle
                        (fontSize: 30.0))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Track"),
      ),
      body: ListView.builder(
        itemCount:pitchData==null ? 0 : pitchData.length,
        itemBuilder: (BuildContext context, int index) =>
            buildCardView(context, index),
      ),
    );
  }
}

// class MainContent extends StatefulWidget {
//   final List<Pitch> list = [];
//   List pitchData;
//   Future getPitchForInnovator() async {
//     http.Response response = await http.post(GetUserPitch,body: {
//       "id":"1"
//     });
//     pitchData = json.decode(response.body);
//     print(pitchData);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: new ListView.builder(
//         itemCount: list.length,
//         itemBuilder: (BuildContext context, int index) =>
//             buildCardView(context, index),
//       ),
//     );
//   }
//
//   Widget buildCardView(BuildContext context, int index) {
//     final pitch = list[index];
//     return new Container(
//       child: new GestureDetector(
//         onTap: (){
//           Navigator.push(context, MaterialPageRoute(
//               builder: (context)=>PitchOffer()));
//         },
//         child: Card(
//           color: Colors.lightBlue,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(top:8.0,bottom: 10.0),
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                    children: <Widget>[
//                     Text(pitch.title,style: new TextStyle(fontSize: 30.0),
//                       textAlign:TextAlign.center),
//                     Spacer(),
//                   ]),
//                 ),
//
//                   ButtonBar(
//                     alignment: MainAxisAlignment.start,
//                     children: [
//                       FlatButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(
//                               builder: (context)=>ViewPitchPage()));
//                         },
//                         child: const Text('VIEW PITCH',
//                           style:TextStyle(color: Colors.black),),
//                       ),
// //                      FlatButton(
// //                        onPressed: () {
// //                          // Perform some action
// //                        },
// //                        child: const Text('SAVE'),
// //                      ),
//                     ],
//                   ),
//                 Padding(
//                   padding: const EdgeInsets.only(top:4.0,bottom: 15.0),
//                   child: Row(children: <Widget>[
//                     new Icon(Icons.category),
//                     Text(":"+pitch.industry,style: new TextStyle(fontSize: 20.0)),
//                     Spacer(),
//                   ]),
//                 ),
//                 // Padding(
//                 //   padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
//                 //   child: Row(children: <Widget>[
//                 //     new Icon(Icons.location_city),
//                 //     Text(":"+ pitch.location,style: new TextStyle(fontSize:
//                 //     20.0)),
//                 //     Spacer(),
//                 //   ]),
//                 // ),
//                 Padding(
//                   padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
//                   child: Row(
//                     children: <Widget>[
//                   new Icon(Icons.location_city),
//                     Text(":"+ pitch.location,style: new TextStyle(fontSize:
//                     20.0)),
//                       Spacer(),
//                       new Icon(Icons.location_on),
//                       Text(":R${pitch.requiredAmount.toStringAsFixed(2)}",style:
//                       new
//                       TextStyle
//                         (fontSize: 30.0))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   State<StatefulWidget> createState() {
//     // TODO: implement createState
//     throw UnimplementedError();
//   }
// }
