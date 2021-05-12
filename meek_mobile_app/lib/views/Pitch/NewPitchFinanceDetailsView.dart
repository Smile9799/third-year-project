import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_summary_view.dart';

class Amount{
  String amount;
  Amount(this.amount);

  static List<Amount> getLocation(){
    return <Amount>[
      Amount("R1,000"),
      Amount("R5,000"),
      Amount("R10,000"),
      Amount("R25,000"),
      Amount("R50,000"),
      Amount("R100,000"),
      Amount("R150,000"),
      Amount("R200,000"),
      Amount("R250,000"),
      Amount("R300,000"),
      Amount("R450,000"),
      Amount("R500,000"),
      Amount("R600,000"),
      Amount("R700,000"),
      Amount("R800,000"),
      Amount("R900,000"),
      Amount("R1,000,000"),
      Amount("R1,250,000"),
      Amount("R1,500,000"),
      Amount("R1,750,000"),
      Amount("R2,000,000"),
      Amount("R2,250,000"),
      Amount("R2,500,000"),
      Amount("R2,750,000"),
      Amount("R3,000,000"),
      Amount("R3,500,000"),
      Amount("R4,000,000"),
      Amount("R4,500,000"),
      Amount("R5,000,000"),
      Amount("R6,000,000"),
      Amount("R7,000,000"),
      Amount("R8,000,000"),
      Amount("R8,000,000"),
      Amount("R10,000,000"),
      Amount("R15,000,000"),
      Amount("R20,000,000"),
      Amount("R25,000,000"),
      Amount("R30,000,000"),
      Amount("R35,000,000"),
      Amount("R40,000,000"),
      Amount("R45,000,000"),
      Amount("R50,000,000"),
    ];
  }
}
class Industry{
  String industry;

  Industry(this.industry);

  static List<Industry> getIndustry(){
    return <Industry>[
      Industry("Food and Nutrition"),
      Industry("Health"),
      Industry("Construction"),
      Industry("Information Technology"),
      Industry("Automotive"),
    ];
  }
}



class NewPitchFinanceDetailsView extends StatelessWidget {
  String bud;
  String min;
  String max;
  String prev;
  String changeAmount(Amount  amount) {
    String loc;
    loc= amount.amount;
    return loc;
  }
  String minAmount(Amount amount){
    String ind;
    ind= amount.amount;
    return ind;
  }
  String maxAmount(Amount amount){
    String sta;
    sta=amount.amount;
    return sta;
  }
  String prevRound(Amount amount){
    String lo;
    lo=amount.amount;
    return lo;
  }
  final Pitch newpitch;
  NewPitchFinanceDetailsView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your New Pitch (3/9)'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Estimated Project budget"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Budget"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (Amount amount){
                    bud=changeAmount(amount);
                    print(bud);
                  },
                  items: Amount.getLocation().map<DropdownMenuItem<Amount>>((loc)
                  => DropdownMenuItem(
                    value: loc,
                    child: Row(
                      children: <Widget>[
                        Text(loc.amount)
                      ],
                    ),
                  )).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Minimum Investment per Investor"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Amount"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (Amount amount){
                    min=minAmount(amount);
                  },
                  items: Amount.getLocation()
                      .map<DropdownMenuItem<Amount>>((ind)
                  => DropdownMenuItem(
                    value: ind,
                    child: Row(
                      children: <Widget>[
                        Text(ind.amount)
                      ],
                    ),
                  )).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Maximum Investment per Investor"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Amount"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (Amount rol){
                    max=maxAmount(rol);
                  },
                  items: Amount.getLocation()
                      .map<DropdownMenuItem<Amount>>((ind)
                  => DropdownMenuItem(
                    value: ind,
                    child: Row(
                      children: <Widget>[
                        Text(ind.amount)
                      ],
                    ),
                  )).toList(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Amount raised in previous round"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Amount"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (Amount amount){
                    prev=prevRound(amount);
                  },
                  items: Amount.getLocation()
                      .map<DropdownMenuItem<Amount>>((ind)
                  => DropdownMenuItem(
                    value: ind,
                    child: Row(
                      children: <Widget>[
                        Text(ind.amount)
                      ],
                    ),
                  )).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  child: Text("Next"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  elevation: 7.0,
                  color: Colors.lightBlueAccent,
                  onPressed:() {
                    newpitch.budget=bud;
                    newpitch.minimumAmountPerInvestor=min;
                    newpitch.maximumAmountPerInvestor=max;
                    newpitch.amountRaised=prev;
                    Navigator.push(context,MaterialPageRoute(builder: (context)
                    =>NewPitchSummaryView(newpitch: newpitch)) );
                  },
                ),
              )
            ],
          ),
        )
    );
  }

}