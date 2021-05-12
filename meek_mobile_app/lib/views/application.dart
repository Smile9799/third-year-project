import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/track.dart';

import 'Pitch/title_view.dart';
import 'all_pitches.dart';

class Applications extends StatefulWidget {
  @override
  ApplicationsState createState() => ApplicationsState();
}

class ApplicationsState extends State<Applications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Application Section"),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  final  newPitch  = Pitch("",null,null,null,null,null,null,null,null,
      null,null,null,null,null,null);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children:<Widget> [
                  Row(
                    children: <Widget>[
                      new Expanded(child: GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>NewPitchTitleView(newpitch: newPitch,)));
                        },
                        child: new Container(
                          height: 100.0,
                          decoration: new BoxDecoration(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          child: new Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:5.0),
                                  child: new Container(
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: const EdgeInsets.only
                                          (left: 8.0),
                                          child: new Icon(Icons.add,
                                              color:Colors
                                                  .black),
                                        ),
                                        Spacer(),
                                        new Text("Add Pitch",style: TextStyle
                                          (color: Colors.black),),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right:8.0),
                                          child: new Icon(Icons.arrow_forward_ios,
                                              color:Colors
                                                  .black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Expanded(child: new Container(
                        height: 100.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: new Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom:5.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>TrackPitch()));
                                  },
                                  child: new Container(
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: const EdgeInsets.only
                                          (left: 8.0),
                                          child: new Icon(Icons.track_changes,
                                              color:Colors
                                                  .black),
                                        ),
                                        Spacer(),
                                        new Text("Track Pitch Progress",style:
                                        TextStyle
                                          (color: Colors.black),),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right:8.0),
                                          child: new Icon(Icons.arrow_forward_ios,
                                              color:Colors
                                                  .black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      new Expanded(child: new Container(
                        height: 100.0,
                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(5.0),
                        ),
                        child: new Column(
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom:5.0),
                                child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context)=>AllPitches()));
                                  },
                                  child: new Container(
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: const EdgeInsets.only
                                          (left: 8.0),
                                          child: new Icon(Icons.more_vert,
                                              color:Colors
                                                  .black),
                                        ),
                                        Spacer(),
                                        new Text("All Pitches",style: TextStyle
                                          (color: Colors.black),),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right:8.0),
                                          child: new Icon(Icons.arrow_forward_ios,
                                              color:Colors
                                                  .black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}