import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meek_mobile_app/constans.dart';
import 'package:meek_mobile_app/views/registration.dart';
import 'package:meek_mobile_app/widgets/bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/widgets/bottom_navigation_bar2.dart';

String username;
String UserId;
String FirstName;
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => new Registration()
      },
      home: new MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //controllers for user input
  TextEditingController user=new TextEditingController();
  TextEditingController pass=new TextEditingController();

  //function for sending input and getting response
  Future<List> _login() async {
    final response = await http.post(UserLogin, body: {
      "Email": user.text,
      "Password": pass.text,
    });
    //breakdown the response
    var datauser = json.decode(response.body);
    print(datauser);

    username= datauser[0]['Email'];
    UserId= datauser[0]['id'].toString();
    FirstName = datauser[0]['FirstName'];
    print(username);
    print(UserId);

    //process the information
    if(datauser.length==0){
      print('No information parsed');
    }
    else {
      if(datauser[0]['usertype']=='Innovator'){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

      }
      else if(datauser[0]['usertype']=='Investor'){

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage2()),
        );

      }
      else{

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
      setState(() {

      });

    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return new Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              children: [
                SizedBox(height: 90,),
                Image(image: AssetImage("assets/icons/logo.PNG"),
                fit: BoxFit.fitHeight,height: 100,),

//                SvgPicture.asset(
//                  "assets/icons/newlogo.svg",
//                  height: size.height * 0.30,
//                ),
                Divider(
                  color: Colors.black,
                  height: 20,
                  thickness: 5,
                  indent: 20,
                  endIndent: 20,
                ),
              ],
            ),
            Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(15.0, 2.0, 0.0, 0.0),
                    child: Text('                              Welcome',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(16.0, 20.0, 0.0, 0.0),
                    child: Text('                                  Back',
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(57.0, 12.0, 0.0, 0.0),
                    child: Text('                       .',
                        style: TextStyle(
                            fontSize:30.0,
                            fontWeight: FontWeight.bold,
                            color:Color.fromRGBO(255, 159,103, 3))),
                  )
                ],
              ),
            ),


            Container(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: user,
                      decoration: InputDecoration(
                          labelText: 'EMAIL',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(170, 109,255, 3)))),
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: pass,
                      decoration: InputDecoration(
                          labelText: 'PASSWORD',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(170, 109,255, 3)))),
                      obscureText: true,
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      alignment: Alignment(1.0, 0.0),
                      padding: EdgeInsets.only(top: 15.0, left: 20.0),
                      child: InkWell(
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    GestureDetector(
                      onTap: (){
                        _login();
                        },
                      child: Container(
                        height: 40.0,
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          shadowColor:Color.fromRGBO(170, 109,255, 3),
                          color:  Color.fromRGBO(255, 159,103, 3),
                          elevation: 7.0,
                            child: Center(
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,),
                              ),
                            ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                  ],
                )),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                ),
                SizedBox(width: 5.0),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed('/signup');
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}


