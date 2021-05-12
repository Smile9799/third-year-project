import 'package:flutter/material.dart';

class HomePages extends StatefulWidget {
  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Home"),
      ),
      body:MainContent(),
    );
  }
}
class MainContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Container(
              child: new Column(
            children: [
              // Row(
              //   children: <Widget>[
              //     new Text(
              //       "Home",
              //       style: new TextStyle(fontSize: 30.0),
              //       textAlign: TextAlign.left,
              //     )
              //   ],
              // ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: new Container(
                    height: 100.0,
                    decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(5.0),
                          color: Color(0xFFFD7384)),
                    child: new Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Icon(Icons.drive_eta, color: Colors.white),
                          new Text(
                            "Motor",
                            style: new TextStyle(color: Colors.white),
                          )
                        ],
                    ),
                  ),
                      )),
                  new Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: new Container(
                    height: 100.0,
                    child: Column(
                        children: <Widget>[
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom:5.0),
                                child: new Container(
                                  decoration: new BoxDecoration(
                                    color: Color(0xFF2BD093),borderRadius: new
                                  BorderRadius.circular(5.0)
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(padding: const EdgeInsets.only
                                        (right: 8.0),
                                       child: new Icon(Icons.account_circle,
                                           color:Colors
                                            .white),
                                      ),
                                      new Text("Classified",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                          ),
                          Expanded(
                            child: new Container(
                              decoration: new BoxDecoration(
                                  color: Color(0xFFFc7B4D),borderRadius: new
                              BorderRadius.circular(5.0)
                              ),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(padding: const EdgeInsets.only
                                    (right: 8.0),
                                    child: new Icon(Icons.location_on,
                                        color:Colors
                                            .white),
                                  ),
                                  new Text("Classified",style: TextStyle(color: Colors.white),)
                                ],
                              ),
                            ),
                          ),
                        ],
                    ),
                  ),
                      )),
                  new Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:5.0),
                        child: new Container(
                          height: 100.0,
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom:5.0),
                                  child: new Container(
                                    decoration: new BoxDecoration(
                                        color: Color(0xFF2BD093),borderRadius: new
                                    BorderRadius.circular(5.0)
                                    ),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(padding: const EdgeInsets.only
                                          (right: 8.0),
                                          child: new Icon(Icons.account_balance,
                                              color:Colors
                                                  .white),
                                        ),
                                        new Text("Properties",style: TextStyle
                                          (color: Colors.white),)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: new Container(
                                  decoration: new BoxDecoration(
                                      color: Color(0xFFFc7B4D),borderRadius: new
                                  BorderRadius.circular(5.0)
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(padding: const EdgeInsets.only
                                        (right: 8.0),
                                        child: new Icon(Icons.location_on,
                                            color:Colors
                                                .white),
                                      ),
                                      new Text("Arsenal",style: TextStyle(color:
                                      Colors.white),)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(child: new  Text("Tranding news",style: new
                  TextStyle(fontSize: 18.0),),),
                  new Expanded(child: new  Text("View All",style: new
                  TextStyle(color: Color(0xFF2BD093)),textAlign: TextAlign
                      .end,)),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                      child: Container(
                        height: 140.0,
                        child: new Column(
                          children:<Widget> [
                            new Container(
                              height: 100.0,
                              decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                  image: new DecorationImage(image: new
                                  AssetImage('assets/index.png'),
                                  fit:BoxFit.cover
                                  )
                            ),
                            ),
                            new Text("News Logo",style: new TextStyle
                              (fontSize: 16.0),),
                          ],
                        ),
                      ),),
                  new SizedBox(width: 5.0,),
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                  new SizedBox(width: 5.0,),
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                  new SizedBox(width: 5.0,),
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                  new SizedBox(width: 5.0,),
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              Row(
                children: <Widget>[
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                  new SizedBox(width: 5.0,),
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                  new SizedBox(width: 5.0,),
                  new Expanded(
                    child: Container(
                      height: 140.0,
                      child: new Column(
                        children:<Widget> [
                          new Container(
                            height: 100.0,
                            decoration: new BoxDecoration(
                                borderRadius: new BorderRadius.circular(5.0),
                                image: new DecorationImage(image: new
                                AssetImage('assets/index.png'),
                                    fit:BoxFit.cover
                                )
                            ),
                          ),
                          new Text("News Logo",style: new TextStyle
                            (fontSize: 16.0),),
                        ],
                      ),
                    ),),
                ],
              ),
            ],
          )
          ),
        )
      ],
    );
  }
}
