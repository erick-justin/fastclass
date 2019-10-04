

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'Utilities/dialogs.dart';
import 'Utilities/systemConstants.dart';
import 'signup.dart';
import 'home.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
BuildContext mContext;

void main() {

  print("sdvedf");

  runApp(
    MaterialApp(
      theme: ThemeData(

      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen()
    ),
  );
}

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return login();
  }


}

String phoneNumber = "";
String password = "";

// ignore: camel_case_types
class login extends State<LoginScreen>{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    mContext = context;
    return  Scaffold(
      body: screen(),
    );
  }

}

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
                  color: appBlueColor,
                )),
          ),
          Flexible(
            flex: 6,
            child: Container(
              color: appGreenColor,
              child: ListView(
                children: <Widget>[
                  Container(
                    child: Container(
                      child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                        child: new TextField(
                          onChanged: (text){
                            phoneNumber = text;
                          },
                          decoration: new InputDecoration(
                            labelText: "Phone Number",
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(color:Color.fromRGBO(4, 45, 106, 1),width: 2.0),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(color:Color.fromRGBO(4, 45, 106, 1),width: 2.0),
                            ),
                            //fillColor: Colors.green
                          ),

                          keyboardType: TextInputType.phone,
                          style: new TextStyle(

                            fontFamily: "Poppins",
                              color: Colors.white
                          ),
                        ),
                      ),),
                  ),
                  Container(
                    child: Container(
                      child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                        child: new TextField(
                          onChanged: (text){
                            password = text;
                          },
                          obscureText: true,
                          decoration: new InputDecoration(
                            labelText: "Password",

                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(color:Color.fromRGBO(4, 45, 106, 1),width: 2.0),
                            ),
                            focusedBorder: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25.0),
                              borderSide: new BorderSide(color:Color.fromRGBO(4, 45, 106, 1),width: 2.0),
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
                    child: button(),

          ),
                ],
              ),
            ),
          )
          , Flexible(
            flex: 1,
            child: Container(
              color: appGreenColor,
              child:
                  InkWell(
                    onTap: (){
                      Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>singUp()));
                    },

                    child:
              Padding(padding: EdgeInsets.all(16)
                ,child:Center(
                child: Text("Register",style: TextStyle(color: Colors.white, fontSize: 15),),),

            ),
          ),),)
        ],
      ),
    ),
  );
}

Widget fillBox() {
  return  new Container(
          child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
          child: new TextField(

                decoration: new InputDecoration(
                  labelText: "Enter Email",
                   labelStyle: TextStyle(color: Colors.white),
                   enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color:Color.fromRGBO(4, 45, 106, 1),width: 2.0),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(25.0),
                    borderSide: new BorderSide(color:Color.fromRGBO(4, 45, 106, 1),width: 2.0),
                  ),
                  //fillColor: Colors.green
                ),

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
      color: Color.fromRGBO(4, 45, 106, 1),
    shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)),


      child: Text("LOGN"),
    onPressed: () {
        if(isNotEmpty()) {
          MessageDialogs().loadingIndicator(mContext);
          createPost(serverUrl, loginData());
        }
       //
    },)
  ;

}


 bool isNotEmpty(){
    bool value = true;
    if(password.isEmpty ){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Password", 3422);
       value =  false;
    }
    else if (phoneNumber.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Phone", 3422);
      value = false;
    }

    return value;

 }


String loginData(){
  Map<String, dynamic> request = new Map();
  Map<String, dynamic> data = new Map();

  request['code'] = "101";
  data['phone_number'] = phoneNumber;
  data['password'] = password;
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
  Future<void> identifyResponse(String jsonString) async{
    MessageDialogs().dismissDialogs(mContext);
    if(jsonString != null){
      var responseBody =  jsonDecode(jsonString);
      int code = responseBody['code'];
      if (code == 200){
           var userDetails = responseBody['user_details'];
           SharedPreferences preferences = await SharedPreferences.getInstance();
           preferences.setString("user_id", userDetails['user_id']);
           preferences.setString("email", userDetails['email']);
           preferences.setString("phone_number",userDetails['phone_number']);
           preferences.setString("username", userDetails['full_name']);
           Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>homeScreen()));
        
      }else{
        MessageDialogs().messageDialog(mContext,"Error!",responseBody['msg'],54);
      }







     }



  }







