import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_business_view.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';

class NewPitchSummaryView extends StatelessWidget {
  final Pitch newpitch;
  NewPitchSummaryView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    titleController.text = newpitch.shortSummary;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Create Your New Pitch (4/9)'),
        // ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Enter Your Pitch Summary"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent)
                      ),
                      hintText: "Add Your Pitch Summary Here"
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                ),
              ),
              RaisedButton(
                child: Text("Next"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 7.0,
                color: Colors.lightBlueAccent,
                onPressed:() {
                  newpitch.shortSummary= titleController.text;
                  Navigator.push(context,MaterialPageRoute(builder: (context)
                  =>NewPitchBusinessView(newpitch: newpitch)) );
                },
              )
            ],
          ),
        )
    );
  }
}
