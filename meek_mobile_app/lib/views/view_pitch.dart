import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ViewPitch extends StatefulWidget {
  @override
  _ViewPitchState createState() => _ViewPitchState();
}

class _ViewPitchState extends State<ViewPitch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("View Pitch"),
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
      children:<Widget> [
        new Container(
          child: new Column(
            children:<Widget> [
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget> [
                  new AutoSizeText(
                    "Pitch Title",
                    style: new TextStyle(fontSize: 30.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(child:
                      new Column(
                        children:<Widget> [
                          new  Text("Emmanuel try some nice outline for view "
                              "entire pitch",style: new
                          TextStyle(fontSize: 18.0),textAlign: TextAlign.center),
                          new Icon(Icons.location_on,color: Colors.green,),
                        ],
                      ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}