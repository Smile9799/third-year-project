import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'home1.dart';
import 'main.dart';


class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final appTitle = 'MEEK Investments';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}


class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//      appBar: AppBar(
//        backgroundColor:Colors.blue,
//        title: Text(title,
//            style:TextStyle(
//                fontWeight:FontWeight.bold,
//                color: Colors.white)),
////      color: Colors.blueGrey[300],
//      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10,),
            Container(
              child: Center(
                child: Text('Meek Investments',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),),
            SizedBox(height: 10,),
            Container(color: Colors.blue,
              child: Text('',
                style: TextStyle(
                  fontSize: 1,
                  fontWeight: FontWeight.bold,
                ),),
            ),
//            Container(
//              margin: EdgeInsets.all(10.0),
//              color:Colors.grey[50],
//              width:48.0,
//              height:48.0,
//              child: Row(
//                children: <Widget>[
//                  IconButton(
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Home1()),
//                      );
//                    },
//                    icon: Icon(
//                      Icons.settings,
//                      color: Colors.black87,
//                      size: 27,
//
//                    ),
//                  ),
//
//
//                  OutlineButton(
//                    color: Colors.yellow,
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => Home1()),
//                      );
//                    },
//                    child: new Text(
//                      'Home'
//                      ,
//                      style: TextStyle(
//                          color: Colors.black
//                      ),
//                    ),
//
//                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),side:BorderSide(color: Colors.redAccent),
//
//                    ),
//                  ),
//                  SizedBox(width: 10,),
//
//                  OutlineButton(
//                    color: Colors.yellow,
//
//                    onPressed: () {
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(builder: (context) => NewsPage()),
//                      );
//                    },
//                    child: new Text(
//                      'News'
//                      ,
//                      style: TextStyle(
//                          color: Colors.black
//                      ),
//                    ),
//                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),side:BorderSide(color: Colors.redAccent),),
//                  ),
//                  SizedBox(width: 10,),
//
////                    OutlineButton(
////
////                      onPressed: () async   {
////                        dynamic result = await Navigator.pushNamed(context, '/login');
////                      },
////                        child: new Text(
////                          'Information'
////                          ,
////                          style: TextStyle(
////                              color: Colors.black
////                          ),
////                        ),
////                        shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),side:BorderSide(color: Colors.redAccent),),
////
////                    ),
////                  FlatButton(
////                    onPressed: () {
////                      Navigator.push(
////                        context,
////                        MaterialPageRoute(builder: (context) => StatsPage()),
////                      );
////                    },
////                    child: new Text(
////                      'Statistics'
////                      ,
////                      style: TextStyle(
////                          color: Colors.black
////                      ),
////                    ),
////                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0),side:BorderSide(color: Colors.blueAccent),),
////
////                  ),
//
//
//                ],
//
//              ),
//            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text('Welcome to our news',
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
            Container(
                alignment: const Alignment(1.0,10.0),
                child: FloatingActionButton(
                  onPressed: () async   {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home1()),
                    );
                  },
                  child: Icon(Icons.add),
                  backgroundColor: Colors.blue,


                )

            ),

            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle,color: Colors.black87,),
                    title: const Text('The First Business Rule',style: TextStyle(color: Colors.black87),),
                    subtitle: Text(
                      'An inside story from our investors',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      '"I gave it my all because it was going to be successful, There was simply no other way"',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          // Perform some actiona
                        },
                        child: const Text('READ MORE'),
                      ),
//                      FlatButton(
//                        onPressed: () {
//                          // Perform some action
//                        },
//                        child: const Text('SAVE'),
//                      ),
                    ],
                  ),
                  Image.asset('assets/images/vusi2.jpg'),
                ],
              ),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.arrow_drop_down_circle,color: Colors.black87,),
                    title: const Text('The rise of Tesla and Elon Musk',style: TextStyle(color: Colors.black87),),
                    subtitle: Text(
                      'How did Tesla start? What made it so successful?',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Tesla has rose to be a car manufacturing giant company. Its revenue promising for investors and set out to only get better......',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.start,
                    children: [
                      FlatButton(
                        onPressed: () {
                          // Perform some action
                        },
                        child: const Text('READ MORE'),
                      ),
//                      FlatButton(
//                        onPressed: () {
//                          // Perform some action
//                        },
//                        child: const Text('ACTION 2'),
//                      ),
                    ],
                  ),
                  Image.asset('assets/images/tesla.jpg'),
                ],
              ),
            ),
          ],
        ),

      ),

    );
  }
}