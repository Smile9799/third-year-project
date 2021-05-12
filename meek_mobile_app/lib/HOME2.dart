import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:meek_mobile_app/views/NewsPage.dart';
import 'package:video_player/video_player.dart';

String Name;

class Home2 extends StatefulWidget {
  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[

            Container(
              color: Colors.lightBlue,
              width: MediaQuery.of(context).size.width,
              child: Row(

                children: <Widget>[
                  Center(
                    child: Text('                        Meek Investments',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(height: 50,)
                ],
              ),


            ),
//            SizedBox(height: 10,),
            Container(color: Colors.blue,
              child: Text('',
                style: TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.bold,
                ),),
            ),
//

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Looking for an investor? Zero To Zillion',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('We are here to help you. We will get you in touch with an investor, ready to bring your business to life!',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),

              ),
            ),
//
            CarouselSlider(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1.0,
              items:[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image:DecorationImage(
                      image:AssetImage('assets/images/business5.jpg', ),
                    ),

                  ),


                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image:DecorationImage(
                      image:AssetImage('assets/images/business4.jpg', ),
                    ),

                  ),


                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image:DecorationImage(
                      image:AssetImage('assets/images/business10.jpg', ),
                    ),

                  ),


                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image:DecorationImage(
                      image:AssetImage('assets/images/business5.jpg', ),
                    ),

                  ),


                ),
                //
                //                ),

              ],
            ),
            CarouselSlider(
              height: 300.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16/9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 1.0,
              items:[
                Card(
                  clipBehavior: Clip.antiAlias,
                  color:Colors.lightBlue[50],
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('PITCH YOUR IDEA WITH US',style: TextStyle(color: Colors.black),),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'We help you grow your ideas into a large business. \n'
                              'The platform is filled with potential investors who are looking into funding projects. \n'
                              'Do not hesitate to have a look through our site',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {
                              // Perform some actiona
                            },
                            child: const Text('SUBMIT YOUR PITCH',
                              style:TextStyle(color: Colors.blue),),
                          ),
//                      FlatButton(
//                        onPressed: () {
//                          // Perform some action
//                        },
//                        child: const Text('SAVE'),
//                      ),
                        ],
                      ),
//                              Image.asset('assets/images/vusi2.jpg'),
                    ],
                  ),
                ),

                Card(
                  clipBehavior: Clip.antiAlias,
                  color:Colors.lightBlue[50],
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('LOOKING FOR A PROJECT',style: TextStyle(color: Colors.black),),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'If you are looking to fund projects in specific fields \n'
                              'You have come to the right place. We have project ideas varying in different fields. \n'
                              'You will not be dissapointed. Register with us and grow!',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {
                              // Perform some actiona
                            },
                            child: const Text('FIND PROJECTS',
                              style:TextStyle(color: Colors.blue),),
                          ),
//                      FlatButton(
//                        onPressed: () {
//                          // Perform some action
//                        },
//                        child: const Text('SAVE'),
//                      ),
                        ],
                      ),
//                              Image.asset('assets/images/vusi2.jpg'),
                    ],
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  color:Colors.lightBlue[50],
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('WHO ARE WE?',style: TextStyle(color: Colors.black),),

                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'We are the MEEK Investment system and we help people with  \n'
                              'innovative ideas to grow their ideas by providing a  \n'
                              'platform that links them to potential investors',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.start,
                        children: [
                          FlatButton(
                            onPressed: () {
                              // Perform some actiona
                            },
                            child: const Text('KNOW MORE',
                              style:TextStyle(color: Colors.blue),),
                          ),
//                      FlatButton(
//                        onPressed: () {
//                          // Perform some action
//                        },
//                        child: const Text('SAVE'),
//                      ),
                        ],
                      ),
//                              Image.asset('assets/images/vusi2.jpg'),
                    ],
                  ),
                ),
                //
                //                ),

              ],
            ),

          ],
        ),
      ),
    );
  }
}
