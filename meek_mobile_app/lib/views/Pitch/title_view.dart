import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';

class NewPitchTitleView extends StatelessWidget {
  final Pitch newpitch;
  NewPitchTitleView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    titleController.text = newpitch.title;
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Your New Pitch (1/9)'),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget> [
            Text("Enter Your Pitch Title"),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  focusedBorder:OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent)
                  ),
                  hintText: "Add Your Pitch Title Here"
                ),
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 7.0,
                color: Colors.lightBlueAccent,
                child: Text("Next"),
                onPressed:() {
                  newpitch.title= titleController.text;
                    Navigator.push(context,MaterialPageRoute(builder: (context)
                    =>NewPitchDetailsView(newpitch: newpitch)) );
                    },
              ),
            )
          ],
        ),
      )
    );
  }
}
