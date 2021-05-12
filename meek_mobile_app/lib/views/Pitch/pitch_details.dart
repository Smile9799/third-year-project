import 'package:flutter/material.dart';
import 'package:meek_mobile_app/model/SubmitPitch.dart';
import 'package:meek_mobile_app/views/Pitch/pitch_details.dart';

import 'NewPitchFinanceDetailsView.dart';
String choice;
class Location{
  String location;
  Location(this.location);

  static List<Location> getLocation(){
    return <Location>[
      Location("Limpopo"),
      Location("Gauteng"),
      Location("Mpumalanga"),
      Location("Free State"),
      Location("Kwazulu-Natal"),
      Location("Nothern Cape"),
      Location("Eastern Cape"),
      Location("Western Cape"),
      Location("North West"),
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
class Stage{
  String stage;

  Stage(this.stage);

  static List<Stage> getStage(){
    return <Stage>[
      Stage("Still an Idea"),
      Stage("Startup"),
      Stage("Archiving sales"),
      Stage("Finished Product"),
    ];
  }
}
class Role{
  String role;

  Role(this.role);

  static List<Role> getRole(){
    return <Role>[
      Role("Partnership"),
      Role("Silent type")
    ];
  }
}

class NewPitchDetailsView extends StatelessWidget {
  String loc;
  String ind;
  String stage;
  String role;
  String changeLocation(Location  location) {
    String loc;
    loc= location.location;
    return loc;
  }
  String chooseIndustry(Industry industry){
    String ind;
    ind= industry.industry;
    return ind;
  }
  String chooseStage(Stage stage){
    String sta;
     sta=stage.stage;
     return sta;
  }
  String chooseRole(Role role){
    String lo;
    lo=role.role;
    return lo;
  }
  final Pitch newpitch;
  NewPitchDetailsView({Key key,@required this.newpitch}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Your New Pitch (2/9)'),
        ),
        body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget> [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Where are the management located?"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Location"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,

                  onChanged: (Location location){
                    loc=changeLocation(location);
                    print(loc);
                  },
                  items: Location.getLocation().map<DropdownMenuItem<Location>>((loc)
                  => DropdownMenuItem(
                    value: loc,
                      child: Row(
                      children: <Widget>[
                        Text(loc.location)
                      ],
                      ),
                  )).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("What's the business industry?"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(


                  hint: Text("Industry"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,

                  items: Industry.getIndustry()
                      .map<DropdownMenuItem<Industry>>((ind)
                  => DropdownMenuItem(
                    child: Row(
                      children: <Widget>[
                        Text(ind.industry)
                      ],

                    ),
                    value: ind,


                  )).toList(),
                  onChanged: (Industry industry){
                    ind=chooseIndustry(industry);
                    },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("What's the Investor Role?"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Role"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (Role rol){
                    role=chooseRole(rol);
                  },
                  items: Role.getRole()
                      .map<DropdownMenuItem<Role>>((ind)
                  => DropdownMenuItem(
                    value: ind,
                    child: Row(
                      children: <Widget>[
                        Text(ind.role)
                      ],
                    ),
                  )).toList(),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("What's the business Stage?"),
              ),
              Padding(
                padding: const EdgeInsets.only(left:16.0,right: 16.0),
                child: DropdownButton(
                  hint: Text("Stage"),
                  dropdownColor: Colors.lightBlueAccent,
                  elevation: 5,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  isExpanded: true,
                  onChanged: (Stage stag){
                    stage=chooseStage(stag);
                  },
                  items: Stage.getStage()
                      .map<DropdownMenuItem<Stage>>((ind)
                  => DropdownMenuItem(
                    value: ind,
                    child: Row(
                      children: <Widget>[
                        Text(ind.stage)
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
                    newpitch.location=loc;
                    newpitch.stage=stage;
                    newpitch.industry=ind;
                    newpitch.investorRole=role;
                    print(newpitch.location+"\n"+newpitch.stage +"\n" +newpitch
                        .industry+"\n" +newpitch.investorRole);
                    Navigator.push(context,MaterialPageRoute(builder: (context)
                    =>NewPitchFinanceDetailsView(newpitch: newpitch)) );
                  },
                ),
              )
            ],
          ),
        )
    );
  }
}
