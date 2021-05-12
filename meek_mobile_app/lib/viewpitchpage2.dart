import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:meek_mobile_app/tracknew.dart';
import 'package:meek_mobile_app/views/login.dart';

import 'constans.dart';


class ViewPitchPage2 extends StatefulWidget {
  // ignore: non_constant_identifier_names
  ViewPitchPage2({this.UserIDD});
  final String UserIDD;
  @override
  _ViewPitchPage2State createState() => _ViewPitchPage2State();
}

class _ViewPitchPage2State extends State<ViewPitchPage2> {
  Map data;
  List userData;
  List userData2;

  Future getData() async {
    print(UserId);

    http.Response response = await http.get(GetPitch);
//    print(UserId);
    String InnovatorId = '';
    var datauser2 = json.decode(response.body);
    print(datauser2);
//
    userData = json.decode(response.body);
    UserIDD = userData[0]['InnovatorId'];
    print(userData);
    setState(() {
//        userData;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),
        backgroundColor: Colors.grey[50],
        title: Text("            Full Pitch View",
          style: TextStyle(
              color: Colors.black
          ),),
      ),
      body:
      SafeArea(

        child: ListView.builder(
            itemCount: userData == null ? 0 : userData.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(


                children: <Widget>[
                  Card(
                    color: Colors.grey[50],
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        ListTile(
//                leading: Icon(Icons.portrait,color: Colors.black87,),
                          title:  Text(
                            //PitchName:${userData[index]["PitchName"]}\n
                            "Title:  ${userData[index]["PitchName"]}\n", style: TextStyle(
                              color: Colors.black87,
                              fontSize: 25, fontWeight: FontWeight.bold),),
//                        subtitle: Text(
//                          'By : Palesa    \n',
//
//                          style: TextStyle(color: Colors.black),
//                        ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(child: Row(
                            children: [
                              SizedBox(height: 20, width:20,),
                              Column(
                                children: [
                                  Icon(Icons.location_on),
                                  Text("  Location",
                                    style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue),),
                                  Text("  ${userData[index]["ManagementLocation"]}\n"),
                                ],
                              ),
                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Icon(Icons.business),
                                  Text("Industry",
                                    style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue),),
                                  Text("  ${userData[index]["Industry"]}\n"),
                                ],
                              ),
                              SizedBox(width: 25,),
                              Column(
                                children: [
                                  Icon(Icons.stars),
                                  Text("Stage",
                                    style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.lightBlue),),
                                  Text("  ${userData[index]["Stage"]}\n"),
                                ],
                              ),
                              SizedBox(width: 32,),

                            ],
                          )),
                        ),
                        SizedBox(height: 20,),
                        Column(
                          children: [
                            Icon(Icons.person_pin_circle, size: 40,),
                            Text("    Proposed \n "
                                "Investor Role",
                              style: TextStyle(fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue),),
                            Text("  ${userData[index]["IdealInvestorRole"]}\n"),
                          ],
                        ),
                        Container(
                          color: Colors.grey[100],
                          child: Row(
                            children: [
                              Row(children: [
                                Column(children: [
                                  Center(child: Text(
                                      "                                Budget",
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  ),
                                  Text("                         ${userData[index]["Budget"]}\n",
                                      style: TextStyle(color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold)),
                                ])
                              ]),

                            ],
                          ),
                        ),
                        Container(
                          color: Colors.grey[100],

                          child: Row(
                            children: [
                              Column(children: [
                                Center(child:
                                Text(
                                    "                Minimum Contribution\n                         Per Investor",
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                ),
                                Text("         ${userData[index]["MinimumInvestmentPerInvestor"]}\n",
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))

                              ],),
                              Column(children: [
                                Center(child: Text(
                                    "          Maximum Contribution \n                    Per Investor",
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                ),
                                Text("     ${userData[index]["MaximumInvestmentPerInvestor"]}\n",
                                    style: TextStyle(color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold))

                              ],),
                            ],
                          ),
                        )
                        ,

                        Container(
                          color: Colors.grey[100],
                          child:
                          Row(
                            children: [
                              Text("                             Previously Raised: ",
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              Text("    \n ${userData[index]["PreviousRoundRaise"]}\n",
                                  style: TextStyle(color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),


                            ],
                          ),

                        ),
                        Container(
                          color: Colors.grey[100],
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("Short Summary", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                                  SizedBox(height: 10,),
                                  Text(" ${userData[index]["ShortSummary"]}\n", style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )),
                                  Text("Objectives", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                                  SizedBox(height: 10,),
                                  Text(" ${userData[index]["Objectives"]}\n",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                      )),
                                  Text("Video link", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                                  Text(" ${userData[index]["VideoLink"]}\n", style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )),
                                  SizedBox(height: 10,),
                                  Text("Is Success", style: TextStyle(
                                    fontWeight: FontWeight.bold,

                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                                  Text(" ${userData[index]["isSuccess"]}\n", style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )),
                                  SizedBox(height: 10,),
                                  Text("Reviewed", style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black,
                                  )),
                                  SizedBox(height: 10,),
                                  Text(" ${userData[index]["ReviewerMessage"]}\n", style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                  )),
                                  SizedBox(height: 10,),

                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20,),

                      ],
                    ),
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}
