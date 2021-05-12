import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:meek_mobile_app/addbid1.dart';
import 'package:meek_mobile_app/addmeeting.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/seebid.dart';
import 'package:meek_mobile_app/views/Pitch/title_view.dart';
import 'package:meek_mobile_app/views/meeting.dart';
import 'package:meek_mobile_app/views/slider1/screens/getting_started.dart';
import 'package:meek_mobile_app/widgets/bottom_navigation_bar.dart';
import 'package:meek_mobile_app/widgets/custom_dialog.dart';
import 'login.dart';
import 'meetingsA.dart';
import 'package:flutter_svg/svg.dart';


void main() {
  runApp(MaterialApp(
      initialRoute: '/slider1',
      routes: {
      '/slider1' : (context) => GettingStartedScreen(),
      '/home1': (context) => MyHomePage(),
      '/login': (context) => LoginPage(),
      '/meetinga': (context) => SeeMeeting1(),
       '/addmeeting': (context) => AddMeeting(),
       '/addbid': (context) => AddBid1(),
        '/seebid': (context) => SeeBid1(),




      }
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'MeekInvestment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String,WidgetBuilder>{
        '/signUp':(BuildContext context) => HomePage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final primaryColor = const Color(0xFF89cff0);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: SafeArea(

          child: Column(

            children: <Widget>[
              new Stack(
                children: <Widget>[
                  Center(
                    child: SvgPicture.asset(
                      "assets/icons/newlogo.svg",
                      height: size.height * 0.20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: new Container(
                      height: 200.0,
                      width: 200.0,
                      decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(5.0),
                          image: new DecorationImage(
                              image: new AssetImage('assets/logo.jpeg'))),
                      // child: new Icon(
                      //   Icons.local_offer,
                      //   color: Colors.white,
                      // ),
                    ),
                  )
                ],
              ),
              RaisedButton(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Get Started",
                    style: TextStyle(color: primaryColor, fontSize: 28.0),
                  ),
                ),
                onPressed: () {
                  showDialog(context: context,builder:(BuildContext context) => CustomDialog(
                      title: "Would you like to create a free account?",
                      description: "null",
                      primaryButtonText: "Create Account",
                      primaryButtonRoute: "/signUp") );
                },
              ),
              new SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top:30.0),
                child: FlatButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=>LoginPage()));
                }, child:
                Text("Sign In",style: TextStyle(color: primaryColor,fontSize:
                25.0),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
