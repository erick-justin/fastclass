
import 'dart:convert';

import 'package:flutter/material.dart';
import 'Utilities/dialogs.dart';
import 'Utilities/systemConstants.dart';
import 'colors.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
BuildContext mContext;

// ignore: camel_case_types
class singUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return singUpScreen();
  }

  }



  // ignore: camel_case_types
  class singUpScreen extends State<singUp>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    mContext = context;
    return Scaffold(
      body: screen(),
    );
  }

  }
String fullName;
String phoneNumber;
String email;
String password;

  Widget screen() {
    AssetImage assetImage = new AssetImage("images/logo.png");

    return Material(
      child: Container(
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 4,
              child: Material(
                  elevation: 16.0,
                  child: Container(
                    child: Center(
                        child: Padding(
                          padding: EdgeInsets.all(48.0),
                          child: Image(image: assetImage),
                        )),
                    color: appGreenColor,
                  )),
            ),
            Flexible(
              flex: 6,
              child: Container(
                color:
                appBlueColor,

                child: ListView(
                  children: <Widget>[
                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text) {
                              fullName = text;
                            },
                            textCapitalization: TextCapitalization.words,
                            decoration: new InputDecoration(
                              labelText: "Full Name",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              //fillColor: Colors.green
                            ),

                            keyboardType: TextInputType.text,
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),),
                    ),
                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text) {
                             email = text;
                            },
                            decoration: new InputDecoration(
                              labelText: "Enter Email",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              //fillColor: Colors.green
                            ),

                            keyboardType: TextInputType.emailAddress,
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),),
                    ),

                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text) {
                              phoneNumber = text;
                            },

                            decoration: new InputDecoration(
                              labelText: "Phone Number",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              //fillColor: Colors.green
                            ),


                            keyboardType: TextInputType.phone,
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),),
                    ),
                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text) {
                              password = text;
                            },
                            obscureText: true,

                            decoration: new InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              enabledBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              focusedBorder: new OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(25.0),
                                borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
                              ),
                              //fillColor: Colors.green
                            ),

                            keyboardType: TextInputType.text,
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),),
                    ),
                    Container(

                      padding: EdgeInsets.all(24.0),
                      alignment: Alignment.centerRight,
                    child:

                     button(),



                    ),
                  ],
                ),
              ),
            ),
        Flexible(
        flex: 1,
        child: Container(
          color: appBlueColor,
          child:
          InkWell(
            onTap: (){
              Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>LoginScreen()));
            },

            child:
            Padding(padding: EdgeInsets.all(16)
              ,child:Center(
                child: Text("Login",style: TextStyle(color: Colors.white, fontSize: 15),),),

            ),
          ),),)
          ],
        ),
      ),
    );
  }



// input for the form
Widget fillBox() {
  return  new Container(
    child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
      child: new TextFormField(

        decoration: new InputDecoration(
          labelText: "Enter Email",
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
          ),
          focusedBorder: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(color: Color.fromRGBO(21, 151, 91, 1),width: 2.0),
          ),
          //fillColor: Colors.green
        ),
        validator: (val) {
          if (val.length == 0) {
            return "Email cannot be empty";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.emailAddress,
        style: new TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    ),);



}



Widget button (){
  return
    RaisedButton(
      padding: const EdgeInsets.all(16.0),
      textColor: Colors.white,
      color: Color.fromRGBO(21, 151, 91, 1),
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)),


      child: Text("LOGN"),
      onPressed: () {
        MessageDialogs().loadingIndicator(mContext);
        createPost(serverUrl,loginData());
       // Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>singUp()));
      },)
  ;

}

String loginData(){
  Map<String, dynamic> request = new Map();
  Map<String, dynamic> data = new Map();

  request['code'] = "100";
  data['phone_number'] = phoneNumber;
  data['password'] = password;
  data['full_name'] = fullName;
  data['email'] = email;
  request['data'] = data;
  print(jsonEncode(request));
  return jsonEncode(request);




}




/// Fetches and decodes a JSON object represented as string
/// Returns null if the API server is down, or the response is not JSON.
Future<String> createPost(String url, String jsonString) async {
  print("requesr: "+url+" ,"+jsonString);

  return http.post(url, body:jsonString ).then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 ) {
      MessageDialogs().dismissDialogs(mContext);
      MessageDialogs().messageDialog(mContext, "Error", "Seems There is a problem please try again later", 564);
      throw new Exception("Error while fetching data");

    }
    print(response.body);
    identifyResponse(response.body);
    return response.body;
  });
}


// identifying the incoming response from the server
void identifyResponse(String jsonString){
  MessageDialogs().dismissDialogs(mContext);
  if(jsonString != null){
    var responseBody =  jsonDecode(jsonString);
    int code = responseBody['code'];
    if (code == 200){

      MessageDialogs().messageDialog(mContext,"Success",responseBody['msg'],loginCode);

    }else{
      MessageDialogs().messageDialog(mContext,"Error!",responseBody['msg'],54);
    }







  }



}