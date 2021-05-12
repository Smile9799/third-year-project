import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

var membertypes = ['---Select your member type----','Innovator','Investor'];
var currentItemSelected = '---Select your member type----';

var provinces = ['---Select your province----','Gauteng','Limpopo','Polokwane','Cape Town','Western Cape','North West','KZN'];
var currentProvinceSelected ='---Select your province----';


String InnovatorEmail = '';
String InnovatorPassword = '';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
//  var membertypes = ['Innovator','Investor'];
//  var currentItemSelected = 'Innovator';
  TextEditingController fname=new TextEditingController();
  TextEditingController lname=new TextEditingController();
  TextEditingController pass =new TextEditingController();
  TextEditingController email=new TextEditingController();
  TextEditingController usertype=new TextEditingController();
  TextEditingController address=new TextEditingController();
  TextEditingController phonenumber =new TextEditingController();
  TextEditingController province=new TextEditingController();
  String msg='';

  Future<List> _login() async {
    final response = await http.post("http://10.254.165.49/meekdbapi/register.php", body: {
      "FirstName": fname.text,
      "LastName": lname.text,
      "Password": pass.text,
      "Email": email.text,
      "UserType": currentItemSelected,
      "Address":address.text,
      "PhoneNumber": phonenumber.text,
      "Province":currentProvinceSelected

    });

    var datauser = response.body;
    print(datauser);
    InnovatorEmail = email.text;
    InnovatorPassword= pass.text;
    if(datauser.length==0){
      setState(() {
        msg="Login Fail";
      });
    }else{
      if(datauser=='<!-- 1 -->'){
        if(currentItemSelected=='Innovator')
        {
          Navigator.pushReplacementNamed(context, '/innovreg');
        }else if(currentItemSelected=='Investor')
        {
          Navigator.pushReplacementNamed(context, '/investoreg');

        }

      }else if(datauser ==' Hey success'){
        Navigator.pushReplacementNamed(context, '/home');
      }

      setState(() {
//        username= datauser[0]['username'];
      });

    }
//    return datauser;
  }
//  void main2() {
//    for (int i = 0; i < 5; i++) {
//      print('hello $currentItemSelected');
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
          //change your color here
        ),
        backgroundColor: Colors.blue[100],
        title: Text("Profile",
        style: TextStyle(
          color: Colors.black
        ),),
      ),
      body: SafeArea(
        child:ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0,10.0,10.0,10.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text('Profile',
                    style:TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 20,),

                  TextField(
                    keyboardType: TextInputType.text,
                    controller:fname,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      hintText: 'Enter Your First Name',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.text,
                    controller:lname,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                          ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),

                      prefixIcon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                      ),
                      hintText: 'Enter Your Last Name',
                      hintStyle: new TextStyle(color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: email,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.black,
                      ),
                      hintText: 'Enter your Email',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  TextField(
                    obscureText: true,
                    controller: pass,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.black,
                      ),
                      hintText: 'Enter your Password',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),

                  DropdownButton<String>(
                    style: TextStyle(color: Colors.black),

                    items: membertypes.map((String dropdownStringitem) {

                      return DropdownMenuItem<String>(
                        child:Row(children: [
                          Text(dropdownStringitem),


                        ],
                        ),
                        value: dropdownStringitem,


                      );
                    }).toList(),

                    onChanged:(String newValueSelected){
                      setState(() {
                        currentItemSelected = newValueSelected;
//                  main2();
                      });
                    } ,
                    value: currentItemSelected,
                  ),

                  TextField(
                    keyboardType: TextInputType.text,
                    controller:address,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(30.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Colors.black,
                      ),
                      hintText: 'Enter Your Address Here',
                      hintStyle: TextStyle(
                          color:Colors.black
                      ),
                    ),
                  ),


//            TextField(
//              keyboardType: TextInputType.text,
//              controller:province,
//              style: TextStyle(
//                color: Colors.white,
//                fontFamily: 'OpenSans',
//              ),
//              decoration: InputDecoration(
//                border: InputBorder.none,
//                contentPadding: EdgeInsets.only(top: 14.0),
//                prefixIcon: Icon(
//                  Icons.account_circle,
//                  color: Colors.white,
//                ),
//                hintText: 'Enter Your Province Here',
//                hintStyle: TextStyle(
//                    color:Colors.white
//                ),
//              ),
//            ),
                  DropdownButton<String>(
                    style: TextStyle(color: Colors.black),
                    items: provinces.map((String dropdownProvince) {
                      return DropdownMenuItem<String>(
                        value: dropdownProvince,
                        child: Text(dropdownProvince,
                          style:TextStyle(color: Colors.black) ,),

                      );
                    }).toList(),

                    onChanged:(String newProvinceSelected){
                      setState(() {
                        currentProvinceSelected = newProvinceSelected;
//                  main2();
                      });
                    } ,
                    value: currentProvinceSelected,
                  ),
                  SizedBox(height: 20,),
                  FlatButton.icon(
                    onPressed: ()   {
                      _login();
                    },
                    icon: Icon(
                      Icons.verified_user,
                      color: Colors.black,
                    ),
                    label: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        )
                    ),
                  ),
                ],

              ),
            ),
          ],
        ),

      ),
    );
  }
}
//String selectmember ="";
//final selectedmember = TextEditingController();
//String electmember = currentItemSelected;