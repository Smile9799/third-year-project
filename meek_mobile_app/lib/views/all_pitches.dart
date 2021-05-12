import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/pitch.dart';

import 'login.dart';

class AllPitches extends StatefulWidget {
  @override
  _AllPitchesState createState() => _AllPitchesState();
}

class _AllPitchesState extends State<AllPitches> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("All Pitches"),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  final List<Pitch> list = [
    Pitch("Zoom", "IT", "JHB", 100000.0, 50000.0),
    Pitch("Palesa Food", "Food and Nutrition", "JHB", 100000.0, 50000.0),
    Pitch("FashionBee", "Health", "JHB", 100000.0, 50000.0),
    Pitch("Covid", "Health", "JHB", 100000.0, 50000.0),
    Pitch("Chelsea", "Construction", "JHB", 100000.0, 50000.0)
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: new ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) =>
            buildCardView(context, index),
      ),
    );
  }

  Widget buildCardView(BuildContext context, int index) {
    final pitch = list[index];
    return new Container(
      child: new GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
              builder: (context)=>LoginPage()));
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
                        Text(pitch.title,style: new TextStyle(fontSize: 30.0),
                            textAlign:TextAlign.center),
                        Spacer(),
                      ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:4.0,bottom: 15.0),
                  child: Row(children: <Widget>[
                    new Icon(Icons.category),
                    Text(":"+pitch.industry,style: new TextStyle(fontSize: 20.0)),
                    Spacer(),
                    new Icon(Icons.warning,color: Colors.yellowAccent,),
                    Text(": Not Submitted"),
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
                      Text(":"+ pitch.location,style: new TextStyle(fontSize:
                      20.0)),
                      Spacer(),
                      new Icon(Icons.location_on),
                      Text(":R${pitch.requiredAmount.toStringAsFixed(2)}",style:
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
}