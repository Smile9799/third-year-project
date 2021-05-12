import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../viewpitchpage.dart';

class calendarPage extends StatefulWidget {
  @override
  _calendarPageState createState() => _calendarPageState();
}

class _calendarPageState extends State<calendarPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Investor Offers", style: TextStyle(
            color: Colors.white
        ),),
      ),
      body: Column(
        children: [
          SizedBox(height: 5,),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                  color: Colors.white
              ),
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Investor("Emmanuel Investor"),
                          //Innovator("Alexandra Johnson"),
                          Innovator("Emmanuel Innovator")
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Column(
          //   children: [
          //     FloatingActionButton(onPressed: null,
          //     child: Icon(Icons.add)),
          //   ],
          // )
        ],
      ),
    );
  }
  Row Investor(String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Investor:", style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,fontSize: 17
                ),),
                SizedBox(height: 10,),
                Text(' Pitch Title:', style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
//                    Icon(Icons.timer, color: Colors.lightBlueAccent,),
                    SizedBox(width: 5,),
                    Text('Message from investor: ', style: TextStyle(
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
        ),
      ],
    );
  }
  Row Innovator(String name)
  {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                            MaterialPageRoute(builder: (context) => ViewPitchPage()),
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}