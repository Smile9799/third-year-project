
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/widgets/bottom_navigation_bar.dart';
import 'package:meek_mobile_app/widgets/bottom_navigation_bar2.dart';

import '../constans.dart';
import 'login.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  int selected;
  String role;
  String selectedRole(int v){
    if(v==1){
      return "Investor";
    }
    else if(v ==2){
      return "Innovator";
    }
    else{
      return "";
    }
  }
  @override
  void initState() {
    super.initState();
    selected=0;
  }
  setSelectedRadio(int val){
    setState(() {
      selected = val;
    });
  }
  TextEditingController fullName =  new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Future<List> _addUser() async{
    final response = await http.post(UserRegistration,body: {
      "FullName": fullName.text,
      "Email": email.text,
      "Password": password.text,
      "Role": role
    });

    var printResponse = response.body;
    print(printResponse);
    var datauser = json.decode(response.body);
    print(datauser);
    //process the information
    if(datauser.length==0){
      print('No information parsed');
    }
    else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

      }

      setState(() {

      });


    return datauser;
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                  child: Text(
                    'Signup',
                    style:
                    TextStyle(fontSize: 80.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                  child: Text(
                    '.',
                    style: TextStyle(
                        fontSize: 80.0,
                        fontWeight: FontWeight.bold,
                        color:Color.fromRGBO(170, 109,255, 3)),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'FULL NAME',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),

                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(170, 109,255, 3)))),
                    controller: fullName,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(170, 109,255, 3)))),
                    controller: email,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color.fromRGBO(170, 109,255, 3)))),
                    obscureText: true,
                    controller: password,
                  ),
                  SizedBox(height: 10.0),
                  new Text("Sign up as...",style: new TextStyle(color:
                  Colors.grey),),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget> [
                      new Radio(value: 1, groupValue:selected, onChanged:(v){
                        setSelectedRadio(v);
                        print(selectedRole(v));
                        role = selectedRole(v);
                        print(role);
                      }),
                      new Text("Investor", style: new TextStyle(color:Colors
                          .grey),),
                      new Radio(value: 2, groupValue:selected, onChanged:(v){
                        print(v);
                        setSelectedRadio(v);
                        role =selectedRole(v);
                        print(role);
                      }),
                      new Text("Innovator",style: new TextStyle(color:Colors
                          .grey)),
                    ],
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Color.fromRGBO(255, 159,103, 3),
                        color: Color.fromRGBO(255, 159,103, 3),
                        elevation: 7.0,
                        child: GestureDetector(
                          onTap: () { _addUser();},
                          child: Center(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {

                        },
                        child:

                        Center(
                          child: Text('Sign In Instead',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,)),
                        ),

                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }
}