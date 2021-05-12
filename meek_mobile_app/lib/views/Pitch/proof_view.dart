import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_objective_view.dart';

class NewPitchProofView extends StatelessWidget {
  final Pitch newpitch;
  NewPitchProofView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    titleController.text = newpitch.progressProof;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your New Pitch (7/9)'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Enter Your proof of progress"),
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
                      hintText: "Add Your Proof Summary Here"
                  ),
                ),
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 7.0,
                color: Colors.lightBlueAccent,
                child: Text("Next"),
                onPressed:() {
                  newpitch.progressProof= titleController.text;
                  Navigator.push(context,MaterialPageRoute(builder: (context)
                  =>NewPitchObjectiveView(newpitch: newpitch)) );
                },
              )
            ],
          ),
        )
    );
  }
}
