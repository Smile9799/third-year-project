import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/views/login.dart';
import 'package:meek_mobile_app/views/meeting2.dart';

import 'constans.dart';

var membertypes = ['---Select your member type----','Innovator','Investor'];
var currentItemSelected = '---Select your member type----';

var provinces = ['---Select your province----','Gauteng','Limpopo','Polokwane','Cape Town','Western Cape','North West','KZN'];
var currentProvinceSelected ='---Select your province----';


String InnovatorEmail = '';
String InnovatorPassword = '';

class AddMeeting extends StatefulWidget {
  @override
  _AddMeetingState createState() => _AddMeetingState();
}

class _AddMeetingState extends State<AddMeeting> {
//  var membertypes = ['Innovator','Investor'];
//  var currentItemSelected = 'Innovator';
  TextEditingController InterviewDate=new TextEditingController();
  TextEditingController InterviewRoom=new TextEditingController();
  TextEditingController InterviewTime =new TextEditingController();
  TextEditingController InterviewVenue=new TextEditingController();
  TextEditingController addressVenue =new TextEditingController();
  TextEditingController InvestorMessage =new TextEditingController();

  String msg='';

  Future<List> _login() async {
    final response = await http.post(AddingMeetingDetails, body: {
      "PitchID": '1',
      "TextMessage": 'none',
      "EquityMessage": 'none',
      "InterviewDate": InterviewDate.text,
      "InterviewRoom": InterviewRoom.text,
      "InterviewTime":InterviewTime.text,
      "InterviewVenue": InterviewVenue.text,
      "addressVenue":  'N/A',
      "isCompleted": 'N/A',
      "isAccepted": 'N/A',
      "UserId":UserId,
      "InvestorMessage": InvestorMessage.text,

    });

    var datauser = response.body;
    print(datauser);

    if(datauser.length==0){
      setState(() {
        msg="Meeting Schedule Failed";
      });
    }else{
      Navigator.push(context, MaterialPageRoute(
        //builder: (context)=>ViewPitchPage(UserIDD: UserIDD)));
          builder: (context)=>Meeting2()));
        }
      setState(() {
//        username= datauser[0]['username'];
      });

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
        title: Text("              Add Meeting",
          style: TextStyle(
              color: Colors.white
          ),),
      ),
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,10.0,10.0,10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
//                  Text('Profile',
//                    style:TextStyle(
//                        fontSize: 20,
//                        color: Colors.black,
//                        fontWeight: FontWeight.bold
//                    ),
//                  ),
                  SizedBox(height: 20,),

                  TextField(
                    keyboardType: TextInputType.text,
                    controller:InterviewDate,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.date_range,
                        color: Colors.black,
                      ),
                      hintText: 'Meeting Date',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller:InterviewVenue,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),

                      prefixIcon: Icon(
                        Icons.home,
                        color: Colors.black,
                      ),
                      hintText: 'Meeting Venue',
                      hintStyle: new TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: InterviewRoom,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.room,
                        color: Colors.black,
                      ),
                      hintText: 'Meeting Room',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: InterviewTime,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        FontAwesomeIcons.businessTime,
                        color: Colors.black,
                      ),
                      hintText: 'Meeting Time',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),


                  TextField(
                    keyboardType: TextInputType.text,
                    controller:InvestorMessage,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        FlutterIcons.message1_ant,
                        color: Colors.black,
                      ),
                      hintText: 'Enter Your Address Here',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),


//
                SizedBox(height: 10,),
                  FlatButton.icon(
                    onPressed: ()   {
                      _login();
                    },
                    icon: Icon(
                      Icons.verified_user,
                      color: Colors.black,
                    ),
                    label: Text(
                        'Add Meeting',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )
                    ),
                  ),
                ],

              ),
            ),
          ],
        ),

      ),
    );
  }
}
