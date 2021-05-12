import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meek_mobile_app/views/application.dart';
import 'package:meek_mobile_app/views/profile.dart';

import '../ProfileNew.dart';
import 'login.dart';

class MorePage extends StatefulWidget {
  @override
  _MorePageState createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          //change your color here
        ),
        backgroundColor: Colors.lightBlue,
        title: Text("                     More",
          style: TextStyle(
              color: Colors.white
          ),),
      ),
      body: MainContent(),
    );
  }
}

class MainContent extends StatelessWidget {
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
                              builder: (context)=>Applications()));
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
                                          child: new Icon(FontAwesomeIcons.fileAlt,
                                              color:Colors
                                                  .black),
                                        ),
                                        Spacer(),
                                        new Text("Applications",style: TextStyle
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
                      new Expanded(child: GestureDetector(
                        onTap:(){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context)=>ProfilePage()));
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
                                          child: new Icon(Icons.person,
                                              color:Colors
                                                  .black),
                                        ),
                                        Spacer(),
                                        new Text("Profile",style: TextStyle
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
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(padding: const EdgeInsets.only
                                        (left: 8.0),
                                        child: new Icon(Icons.new_releases,
                                            color:Colors
                                                .black),
                                      ),
                                      Spacer(),
                                      new Text("About us",style: TextStyle
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
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(padding: const EdgeInsets.only
                                        (left: 8.0),
                                        child: new Icon(Icons.call,
                                            color:Colors
                                                .black),
                                      ),
                                      Spacer(),
                                      new Text("Contact us",style: TextStyle
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
                      )),
                    ],
                  ),
//                  Row(
//                    children: <Widget>[
//                      new Expanded(child: new Container(
//                        height: 100.0,
//                        decoration: new BoxDecoration(
//                          borderRadius: new BorderRadius.circular(5.0),
//                        ),
//                        child: new Column(
//                          //crossAxisAlignment: CrossAxisAlignment.start,
//                          //mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            Expanded(
//                              child: Padding(
//                                padding: const EdgeInsets.only(bottom:5.0),
//                                child: new Container(
//                                  child: new Row(
//                                    mainAxisAlignment: MainAxisAlignment.center,
//                                    children: <Widget>[
//                                      Padding(padding: const EdgeInsets.only
//                                        (left: 8.0),
//                                        child: new Icon(Icons.location_on,
//                                            color:Colors
//                                                .black),
//                                      ),
//                                      Spacer(),
//                                      new Text("Trending news",style: TextStyle
//                                        (color: Colors.black),),
//                                      Spacer(),
//                                      Padding(
//                                        padding: const EdgeInsets.only(right:8.0),
//                                        child: new Icon(Icons.arrow_forward_ios,
//                                            color:Colors
//                                                .black),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            ),
//                          ],
//                        ),
//                      )),
//                    ],
//                  ),
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
                                child: new Container(
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(padding: const EdgeInsets.only
                                        (left: 8.0),
                                        child: new Icon(Icons.lock,
                                            color:Colors
                                                .black),
                                      ),
                                      Spacer(),
                                      new Text("Log out",style: TextStyle
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
