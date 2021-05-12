import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/model/pitch_response.dart';
import 'package:meek_mobile_app/services/pitch_services.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';
import 'package:meek_mobile_app/views/more.dart';
import 'package:meek_mobile_app/widgets/bottom_navigation_bar.dart';

import '../../constans.dart';

class NewPitchVideoView extends StatefulWidget {
  final Pitch newpitch;

  NewPitchVideoView({Key key,@required this.newpitch}):super(key:key);

  @override
  _NewPitchVideoViewState createState() => _NewPitchVideoViewState();
}

class _NewPitchVideoViewState extends State<NewPitchVideoView> {
  MEEKServices meekServices;

  Future<List> _addPitch() async{
    final response = await http.post(AddingPitch,body: {
      "id": "1",
      "PitchName": widget.newpitch.title,
      "ManagementLocation": widget.newpitch.location,
      "Industry": widget.newpitch.industry,
      "Stage": widget.newpitch.stage,
      "IdealInvestorRole": widget.newpitch.investorRole,
      "Budget": widget.newpitch.budget,
      "MinimumInvestmentPerInvestor": widget.newpitch.minimumAmountPerInvestor,
      "MaximumInvestmentPerInvestor": widget.newpitch.maximumAmountPerInvestor,
      "PreviousRoundRaise": widget.newpitch.amountRaised,
      "ShortSummary": widget.newpitch.shortSummary,
      "TheBusiness": widget.newpitch.theBusiness,
      "TheMarket": widget.newpitch.theMarket,
      "ProgressProof": widget.newpitch.progressProof,
      "Objectives": widget.newpitch.objectives,
      "VideoLink": widget.newpitch.videoUrlLink,
      "isSuccess": "0",
      "isReviewed": "0",
      "isDeleted":"0"
    });
    var pitchResponse = response.body;
    print(pitchResponse);

    var datauser = json.decode(response.body);
    print(datauser);


    if(datauser.length==0){
      print('No information parsed');
    }
    else {

        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );



      setState(() {

      });

    }
    return datauser;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = new TextEditingController();
    titleController.text = widget.newpitch.videoUrlLink;
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your New Pitch (9/9)'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Text("Enter Your Pre-recorded video link"),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: titleController,
                  autofocus: true,
                  decoration: InputDecoration(
                      focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.lightBlueAccent)
                      ),
                      hintText: "Add Your Video URL Here"
                  ),
                ),
              ),
              RaisedButton(
                child: Text("Save and Submit"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 7.0,
                color: Colors.lightBlueAccent,
                onPressed:() {
                  widget.newpitch.videoUrlLink= titleController.text;
                  _addPitch();
                  // Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
              RaisedButton(
                child: Text("Save"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                elevation: 7.0,
                color: Colors.lightGreen,
                onPressed:() async{
                  widget.newpitch.videoUrlLink= titleController.text;
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              )
            ],
          ),
        )
    );
  }
}
