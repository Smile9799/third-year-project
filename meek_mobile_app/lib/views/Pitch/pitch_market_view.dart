import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';
import 'package:meek_mobile_app/views/Pitch/proof_view.dart';

class NewPitchMarketView extends StatelessWidget {
  final Pitch newpitch;
  NewPitchMarketView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    titleController.text = newpitch.theBusiness;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your New Pitch (6/9)'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Enter Your Market Summary"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: titleController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent)
                      ),
                      hintText: "Add Your Market Summary Here"
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
                  newpitch.theMarket= titleController.text;
                  Navigator.push(context,MaterialPageRoute(builder: (context)
                  =>NewPitchProofView(newpitch: newpitch)) );
                },
              )
            ],
          ),
        )
    );
  }
}