import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String title,
      description,
      primaryButtonText,
      primaryButtonRoute,
      secondaryButtonText,
      secondaryButtonRoute;

  CustomDialog(
      {@required this.title,
      @required this.description,
      @required this.primaryButtonText,
      @required this.primaryButtonRoute,
      this.secondaryButtonText,
      this.secondaryButtonRoute});
  static const double padding = 20.0;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(padding),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(padding),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0)),
                ]),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: 24.0),
                AutoSizeText(
                  title,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.orange, fontSize: 25.0),
                ),
                SizedBox(height: 24.0),
                AutoSizeText(
                  description,
                  maxLines: 4,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.orange, fontSize: 25.0),
                ),
                SizedBox(height: 24.0),
                RaisedButton(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: AutoSizeText(primaryButtonText,
                      maxLines: 1,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w200)),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .pushReplacementNamed(primaryButtonRoute);
                  },
                ),
                SizedBox(height: 10.0),
                showSecondaryButton(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  showSecondaryButton(BuildContext context) {
    if(secondaryButtonRoute !=null && secondaryButtonText!=null){
      return FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.of(context)
                .pushReplacementNamed(secondaryButtonRoute);
          },
          child: AutoSizeText(
            secondaryButtonText,
            maxLines: 1,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
                fontWeight: FontWeight.w400),
          ));
    }
    else{
      return SizedBox(height: 10.0);
    }
  }
}
