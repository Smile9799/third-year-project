import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meek_mobile_app/views/NewsPage.dart';
import 'package:meek_mobile_app/views/home_page.dart';
import 'package:meek_mobile_app/views/meeting.dart';
import 'package:meek_mobile_app/views/meeting2.dart';
import 'package:meek_mobile_app/views/more.dart';
import 'package:meek_mobile_app/views/profile.dart';
import 'package:meek_mobile_app/views/track.dart';

import '../HOME2.dart';
import '../Tracknew2.dart';
import '../tracknew.dart';
import '../views/home1.dart';


class HomePage2 extends StatefulWidget {
  @override
  // TODO: implement createState
  HomePage2State createState() => HomePage2State();
}

class HomePage2State extends State<HomePage2> {
  int _bottomNavIndex=0;
  final List<Widget> children=[Home2(),NewsPage(),
    TrackNew2(),Meeting2(),MorePage()];
  void OnTapBar(int index){
    setState(() {
      _bottomNavIndex=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      backgroundColor: Colors.white,
      body: children[_bottomNavIndex],
      bottomNavigationBar:new BottomNavigationBar(
        backgroundColor: Colors.white,
        type:BottomNavigationBarType.fixed,
        fixedColor: Color(0xff000000),
        onTap: OnTapBar,
        currentIndex: _bottomNavIndex,
        items: [
          new BottomNavigationBarItem(
            title:new Text('Home'),
            icon: Icon(Icons.home,
            ),
          ),
          new BottomNavigationBarItem(
            title:new Text('News'),
            icon: Icon(
              FontAwesomeIcons.newspaper,size:20,
            ),
          ),
          new BottomNavigationBarItem(
              title:new Text('Applications'),
              icon: Icon(Icons.track_changes,)
          ),
          new BottomNavigationBarItem(
              title:new Text('Meeting'),
              icon: Icon(FontAwesomeIcons.handshake,size:20,)
          ),
          new BottomNavigationBarItem(
              title:new Text('More'),
              icon: Icon(Icons.more_horiz)
          ),
        ],
      ),
    );
  }
}

