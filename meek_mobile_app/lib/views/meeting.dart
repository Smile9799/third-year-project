import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meek_mobile_app/videocall/videomain.dart';
import 'package:meek_mobile_app/views/application.dart';
import 'package:meek_mobile_app/views/meetingsA.dart';

import 'login.dart';

class Meeting1 extends StatefulWidget {
  @override
  _Meeting1State createState() => _Meeting1State();
}

class _Meeting1State extends State<Meeting1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: new AppBar(
//        title: Text("More"),
//      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          color: Colors.blue[100],
          width: MediaQuery.of(context).size.width,
          child: Row(

            children: <Widget>[
              Center(
                child: Text('                               Meeting',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 50,)
            ],
          ),


        ),
        Container(color: Colors.blue,
          child: Text('',
            style: TextStyle(
              fontSize: 1,
              fontWeight: FontWeight.bold,
            ),),
        ),
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
                              builder: (context)=>SeeMeeting1()));
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
                                          (left: 2.0),
                                          child: new Icon(FontAwesomeIcons.calendarAlt,
                                              color:Colors
                                                  .black),
                                        ),
//                                        Spacer(),
                                      SizedBox(width: 10.0,),
                                        new Text("Scheduled Meetings",style: TextStyle
                                          (color: Colors.black),),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right:2.0),
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
                      ),
                      ),
                    ],
                  ),
                      Row(
                      children: <Widget>[
                        new Expanded(child: GestureDetector(
                              onTap:(){
                              Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>VideoCall()));
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
                                                    (left: 2.0),
                                                    child: new Icon(FontAwesomeIcons.phone,
                                                    color:Colors
                                                        .black),
                                                    ),
                                                //                                        Spacer(),
                                                    SizedBox(width: 10.0,),
                                                    new Text("Video Call",style: TextStyle
                                                    (color: Colors.black),),
                                                    Spacer(),
                                                    Padding(
                                                    padding: const EdgeInsets.only(right:2.0),
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



                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
