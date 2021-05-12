import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/views/login.dart';
import 'package:meek_mobile_app/views/meeting2.dart';
import 'package:meek_mobile_app/views/view_offer_details2.dart';
import 'package:meek_mobile_app/views/view_offer_details3.dart';

import 'constans.dart';

var membertypes = ['---Select your member type----','Innovator','Investor'];
var currentItemSelected = '---Select your member type----';

var provinces = ['---Select your province----','Gauteng','Limpopo','Polokwane','Cape Town','Western Cape','North West','KZN'];
var currentProvinceSelected ='---Select your province----';


String InnovatorEmail = '';
String InnovatorPassword = '';

class AddBid2 extends StatefulWidget {
  @override
  _AddBid2State createState() => _AddBid2State();
}

class _AddBid2State extends State<AddBid2> {
//  var membertypes = ['Innovator','Investor'];
//  var currentItemSelected = 'Innovator';
  TextEditingController Innovatorfunds=new TextEditingController();
  TextEditingController Innovatorpercentage=new TextEditingController();
  TextEditingController InnovatorMessage =new TextEditingController();

  String msg='';

  Future<List> _login() async {
    final response = await http.post(CounterInnovatorBidDecision, body: {
      "pitchId": '1',
      "Innovatorfunds": Innovatorfunds.text,
      "Innovatorpercentage":Innovatorpercentage.text,
      "InnovatorMessage": InnovatorMessage.text,

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
          builder: (context)=>calendarPage2()));
    }
    setState(() {
//        username= datauser[0]['username'];
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
          //change your color here
        ),
        backgroundColor: Colors.black,
        title: Text("              Place Bid",
          style: TextStyle(
              color: Colors.white
          ),),
      ),
      body: SafeArea(

        child:ListView(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
                    color: Colors.white
                ),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Column(
                          children: [
//                            Investor("Emmanuel Investor"),
//                            //Innovator("Alexandra Johnson"),
//                            Innovator("Emmanuel Innovator")
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              color:Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15.0,10.0,10.0,10.0),
                child:
                Column(
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
                      controller:Innovatorpercentage,
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
                          Icons.swap_horiz,
                          color: Colors.black,
                        ),
                        hintText: 'Innovator Percentage',
                        hintStyle: TextStyle(
                            color:Colors.black
                        ),
                      ),
                    ),
                    SizedBox(height: 10,),
                    TextField(
                      keyboardType: TextInputType.text,
                      controller:Innovatorfunds,
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
                          Icons.monetization_on,
                          color: Colors.black,
                        ),
                        hintText: ' Innovator Funds',
                        hintStyle: new TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(height: 10,),



                    TextField(
                      keyboardType: TextInputType.text,
                      controller:InnovatorMessage,
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
                        hintText: 'Enter Your Message to Investor here',
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
                          'Add Bid',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          )
                      ),
                    ),
                    SizedBox(height: 400,),

                  ],

                ),
              ),
            ),
          ],
        ),

      ),
    );
  }
}
