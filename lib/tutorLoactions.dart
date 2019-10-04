import 'package:flutter/material.dart';
import 'package:flutter_app2/tutorRequest.dart';
import 'package:flutter_app2/tutorTutor.dart';
import 'Utilities/dialogs.dart';
import 'colors.dart';
import 'FObjects/Curriculum.dart';


BuildContext mContext;
String citizenship = "";
String region = "";
String district = "";
String ward = "";

// ignore: camel_case_types
class tutorLocations extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScreenWidget();

  }
}



AssetImage whiteNext = AssetImage("images/next_white.png");

class ScreenWidget extends State<tutorLocations> {
  @override
  Widget build(BuildContext context) {
    mContext = context;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Tutor Form"),
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
                "Location Details",
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
                        labelText: "Citizenship",
                        labelStyle: TextStyle(color: Colors.white),
                      //  hintText: "e.g NECTA or CAMBRIDGE",
                      //  hintStyle: TextStyle(color: Colors.white),
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
                        citizenship = text;
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
                        labelText: "Region",
                        labelStyle: TextStyle(color: Colors.white),
                        //hintText: "e.g NECTA or CAMBRIDGE",
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
                        region = text;
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
                        labelText: "District",
                        labelStyle: TextStyle(color: Colors.white),
                       // hintText: "e.g NECTA or CAMBRIDGE",
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
                        district = text;
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
                        labelText: "Ward",
                        labelStyle: TextStyle(color: Colors.white),
                        // hintText: "e.g NECTA or CAMBRIDGE",
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

                        ward = text;
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
                      if(isNotEmpty()){
                      Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>tutorTutor()));
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
    if(citizenship.isEmpty ){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Citizenship", 3422);
      value =  false;
    }
    else if (region.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Region", 3422);
      value = false;
    }

    else if (district.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your District", 3422);
      value = false;
    }

    else if (ward.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Ward", 3422);
      value = false;
    }




    return value;

  }



}
