
import 'dart:convert';

import 'package:flutter/material.dart';
import 'Utilities/dialogs.dart';
import 'Utilities/systemConstants.dart';
import 'colors.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

// ignore: camel_case_types
class tutorForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return formScreen();
  }
 }

 String curriculum;
 String mClass;
 String subject;
 String topic;
BuildContext mContext;



  // ignore: camel_case_types
  class formScreen extends State<tutorForm>{
    @override
    Widget build(BuildContext context) {
      // TODO: implement build
      mContext = context;
      return Scaffold(
       // resizeToAvoidBottomPadding:false,
        appBar: AppBar(
          elevation: 0,
          title: Text("Tutor Form"),
          backgroundColor: appGreenColor,
        ),
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
              flex: 2,
              child: Material(
                  elevation: 16.0,
                  child: Container(
                    child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 48.0,top: 16,right: 48.0,bottom: 0),
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
                            onChanged: (text){
                               curriculum = text;
                            },
                            textCapitalization: TextCapitalization.words,

                            decoration: new InputDecoration(
                              labelText: "Cirruculum",
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "e.g NECTA or CAMBRIDGE",
                              hintStyle: TextStyle(color: Colors.white),
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
                        ),)
                      ,
                    ),
                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text){
                             mClass = text;
                            },
                            textCapitalization: TextCapitalization.words,

                            decoration: new InputDecoration(
                              labelText: "Class",
                              hintText: "e.g class 6 or form 5",
                              hintStyle: TextStyle(color: Colors.white),
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
                        ),)
                      ,
                    ),

                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text){
                              subject = text;
                            },
                            textCapitalization: TextCapitalization.words,


                            decoration: new InputDecoration(
                              hintText: "e.g Physics or Civics",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Subject",
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
                        ),)

                    ),
                    Container(
                      child: Container(
                        child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                          child: new TextField(
                            onChanged: (text){
                              topic = text;
                            },
                            textCapitalization: TextCapitalization.words,

                            decoration: new InputDecoration(
                              hintText: "e.g Algebra or Heat",
                              hintStyle: TextStyle(color: Colors.white),
                              labelText: "Topic",
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
                        ),)

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
   textCapitalization: TextCapitalization.words,
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


      child: Text("SEND"),
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

  request['code'] = "200";
  data['user_id'] = userID;
  data['curriculum'] = curriculum;
  data['subject'] = subject;
  data['class'] = mClass;
  data['topic'] = topic;
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

      MessageDialogs().messageDialog(mContext,"Success",responseBody['msg'],homeCode);

    }else{
      MessageDialogs().messageDialog(mContext,"Error!",responseBody['msg'],54);
    }







  }



}