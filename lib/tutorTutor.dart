import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app2/tutorRequest.dart';
import 'Utilities/dialogs.dart';
import 'Utilities/systemConstants.dart';
import 'colors.dart';
import 'FObjects/Curriculum.dart';
import 'home.dart';
import 'tutorLoactions.dart';
import 'package:http/http.dart' as http;


BuildContext mContext;
// ignore: non_constant_identifier_names
String ed_level = "";
String proff = '';
// ignore: non_constant_identifier_names
String teach_lvl = "";
String experience = '';
String status = "";
String occupation= "";
String curriculum = "";
String subject = "";


// ignore: camel_case_types
class tutorTutor extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScreenWidget();

  }
}




AssetImage whiteNext = AssetImage("images/next_white.png");

class ScreenWidget extends State<tutorTutor> {
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
        appBar: AppBar(
          title: Text("Tutor Form"),
          elevation: 0,
          backgroundColor: appGreenColor,
        ),
        body: mainScreen(context));
  }






  Widget mainScreen(BuildContext context) {

    return
      Material(
        child: Container(
          color:appBlueColor,
          child: ListView(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 0,top: 16,right: 0,bottom: 0),
              child:
          Center(

              child: Text(
                "Tutoring Details",
                style: TextStyle(fontSize: 30,
                    color: Colors.white,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.bold),
          ),
          ),),
              Container(
                child: Container(
                  child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                    child: new TextField(

                      decoration: new InputDecoration(
                        labelText: "Education Level",
                        labelStyle: TextStyle(color: Colors.white),
                       hintText: "e.g Diploma",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (text){
                        ed_level = text;
                      },

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

                      decoration: new InputDecoration(
                        labelText: "Professionalism",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "e.g B.A. Economics",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (text){
                       proff = text;
                      },

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

                      decoration: new InputDecoration(
                        labelText: "Levels You Teach",
                        labelStyle: TextStyle(color: Colors.white),
                       hintText: "e.g Primary / O Level",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (text){
                       teach_lvl = text;
                      },


                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),)
                ,
              ),
              SizedBox(
                height: 100,
                child:Padding(padding: EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0) ,
                child:ListView(

                 scrollDirection: Axis.horizontal,
                children: <Widget>[

                   Container(
                    width: MediaQuery.of(mContext).size.width*0.44,
                    child: Padding(padding:  EdgeInsets.only(left: 0,top: 0,right: 16,bottom: 0),
                      child: new TextField(

                        decoration: new InputDecoration(
                          labelText: "Experience",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Years of teaching",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                          ),
                          //fillColor: Colors.green
                        ),
                        onChanged: (text){
                          experience = text;
                        },


                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),)

                  ,Container(
                    width: MediaQuery.of(mContext).size.width*0.44,
                    child: Padding(padding:  EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 0),

                      child: new TextField(

                        decoration: new InputDecoration(
                          labelText: "Teaching Status",
                          labelStyle: TextStyle(color: Colors.white),
                          hintText: "Are you teaching? Yes/No",
                          hintStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                          ),
                          //fillColor: Colors.green
                        ),
                        onChanged: (text){
                          status = text;
                        },


                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),)
                  ,



                ],),
              )
,),
              Container(
                child: Container(
                  child: Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
                    child: new TextField(

                      decoration: new InputDecoration(
                        labelText: "Other Occupation",
                        labelStyle: TextStyle(color: Colors.white),
                         hintText: "e.g Businessman",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (text){
                        occupation = text;
                      },


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

                      decoration: new InputDecoration(
                        labelText: "Curriculum You Teach",
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: "e.g NECTA or CAMBRIDGE",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (text){
                        curriculum = text;
                      },


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

                      decoration: new InputDecoration(
                        labelText: "Subjects",
                        labelStyle: TextStyle(color: Colors.white),
                         hintText: "e.g Mathematics or Civics",
                        hintStyle: TextStyle(color: Colors.white),
                        enabledBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        focusedBorder: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(25.0),
                          borderSide: new BorderSide(color: appGreenColor,width: 2.0),
                        ),
                        //fillColor: Colors.green
                      ),
                      onChanged: (text){
                        subject = text;
                      },


                      keyboardType: TextInputType.text,
                      style: new TextStyle(
                        color: Colors.white,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),)
                ,
              ),




        Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
              child:
              Container(
                alignment: Alignment.centerRight,

                child:
                InkWell(
                    onTap: (){
                      if(isNotEmpty()) {
                       // Navigator.push(mContext, MaterialPageRoute(
                           // builder: (mContext) => tutorLocations()));
                        createPost(serverUrl, requestData());
                        MessageDialogs().loadingIndicator(mContext);
                      }},
                    child: Image(image: whiteNext,height: 70,width: 70,)

                ),),)


            ],


          ),
        ),
      );
  }

  bool isNotEmpty(){
    bool value = true;
    if(ed_level.isEmpty ){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Education Level", 3422);
      value =  false;
    }
    else if (proff.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Proffesionalism", 3422);
      value = false;
    }

    else if (teach_lvl.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Teaching Level", 3422);
      value = false;
    }

    else if (experience.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Experience", 3422);
      value = false;
    }
    else if (status.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Gender", 3422);
      value = false;
    }

    else if(curriculum.isEmpty ){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Curriculum", 3422);
      value =  false;
    }
    else if (subject.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Subject", 3422);
      value = false;
    }

    return value;

  }


  String requestData(){
    Map<String, dynamic> request = new Map();
    Map<String, dynamic> data = new Map();

    request['code'] = "300";
    data['user_id'] = userID;
    data['curriculum'] = curriculum;
    data['subject'] = subject;
    data['occupation'] = occupation;
    data['experience'] = experience;
    data['teaching_status']  = status;
    data['teaching_level'] = teach_lvl;
    data['profession'] = proff;
    data['education_level'] = ed_level;
    data['ward'] = ward;
    data['district'] = district;
    data['region'] = region;
    data['citizenship'] = citizenship;
    data['gender'] = gender;
    data['birth'] = birth;
    data['phone_number'] = phone;
    data['email'] = email;
    data['full_name'] = full_name;
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





}
