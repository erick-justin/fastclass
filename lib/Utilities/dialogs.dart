import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app2/Utilities/systemConstants.dart';

import '../colors.dart';
import '../home.dart';
import '../main.dart';
import '../signup.dart';

class MessageDialogs {
  BuildContext progressContext;


// a dialog to show messages
  Future<void> messageDialog(BuildContext mContext, String header,
      String message, int code) async {
    return showDialog<void>(
      context: mContext,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: appBlueColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))
          ),
          title: Text(header,
            style: TextStyle(
              color: Colors.white,
            ),),
          content: SingleChildScrollView(
            child:
            Container(


              child: Text(message,
                style: TextStyle(
                  color: Colors.white,
                ),)
              ,),),


          actions: <Widget>[
            FlatButton(
              child: Text("OK",
                style: TextStyle(
                  color: Colors.white,
                ),),
              onPressed: () {
                Navigator.of(context).pop();
                if (code == loginCode) {
                  Navigator.push(mContext,
                      MaterialPageRoute(builder: (mContext) => LoginScreen()));
                }
                if(code == homeCode){
                  Navigator.push(mContext,
                      MaterialPageRoute(builder: (mContext) => homeScreen()));

                }
              },
            ),


          ],
        );
      },
    );
  }







 // loading dialog to indication a loading process
var smeContext;
  Future<void> loadingIndicator(BuildContext mContext) async {


    return showDialog<void>(
      context: mContext,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        progressContext = context;
        if(context != null){
          print(context);
        }
        return AlertDialog(
          backgroundColor: appBlueColorwithOpacity,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0))
          ),

          content: SingleChildScrollView(
            child:
            Container(
              height: 100,
              width: 300,
              child:
              Center(
                child:
                Container(
                  width: 70,
                  height: 70,
                  child:CircularProgressIndicator(
                    strokeWidth: 3,
                    semanticsLabel: "Login",
                    backgroundColor: Colors.white,
                  ),
                ),),),),


          actions: <Widget>[



          ],
        );
      },
    );
  }




  void dismissDialogs(BuildContext c){

      Navigator.of(c).pop();







  }







}
