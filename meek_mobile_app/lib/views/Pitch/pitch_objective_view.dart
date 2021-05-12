import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_video_view.dart';

class NewPitchObjectiveView extends StatelessWidget {
  final Pitch newpitch;
  NewPitchObjectiveView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    titleController.text = newpitch.objectives;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your New Pitch (8/9)'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Enter Your Business objectives"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: titleController,
                  autofocus: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent)
                      ),
                      hintText: "Add Your Business Objective Here"
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Next"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 7.0,
                color: Colors.lightBlueAccent,
                onPressed:() {
                  newpitch.objectives= titleController.text;
                  Navigator.push(context,MaterialPageRoute(builder: (context)
                  =>NewPitchVideoView(newpitch: newpitch)) );
                },
              )
            ],
          ),
        )
    );
  }
}
