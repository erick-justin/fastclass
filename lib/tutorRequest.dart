import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'Utilities/dialogs.dart';
import 'colors.dart';
import 'FObjects/Curriculum.dart';
import 'tutorLoactions.dart';


BuildContext mContext;
// ignore: non_constant_identifier_names
String full_name="";
// ignore: non_constant_identifier_names
String phone = "";
String email = "";
String birth = "";
String gender = "";

// ignore: camel_case_types
class tutorRequest extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScreenWidget();

  }
}



AssetImage whiteNext = AssetImage("images/next_white.png");

class ScreenWidget extends State<tutorRequest> {
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
                "Personal Details",
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
                        labelText: "Full Name",
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
                        full_name = text;
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
                        labelText: "Phone Number",
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
                        phone = text;
                      },

                      keyboardType: TextInputType.phone,
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
                        labelText: "Email",
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
                        email = text;
                      },

                      keyboardType: TextInputType.emailAddress,
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
        child: Padding(padding:  EdgeInsets.only(left: 0,top: 0,right: 16,bottom: 12),
          child:
          InkWell(
            child:
            Container(
              child:
              Center(
                  child:Text(_value,
                    style:  TextStyle(color: Colors.white),
                  ))
              ,
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(25.0),
                border: new Border.all(color: appGreenColor,width: 2.0),
              ),


              //fillColor: Colors.green
            ),onTap: (){
            _selectDate();
          },


          ) ,),)
                  ,
                  Container(
                    width: MediaQuery.of(mContext).size.width*0.44,
                    child: Padding(padding:  EdgeInsets.only(left: 0,top: 0,right: 0,bottom: 12),
                      child:
                      Container(
                        child:
                        Center(child:
                         new Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor:appBlueColor,
                        ),
                          child:
                          DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Poppins",
                        ),
                            value: dropdownValue,
                            onChanged: (String newValue) {
                              setState(() {
                                dropdownValue = newValue;
                                gender = newValue;
                              });
                            },
                            items: <String>['Gender','Male', 'Female']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value
                                ,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Poppins",) ,),
                              );
                            }).toList(),
                          ),
                        ),),),

                        decoration: new BoxDecoration(
                          borderRadius: new BorderRadius.circular(25.0),
                          border: new Border.all(color: appGreenColor,width: 2.0),
                        ),


                        //fillColor: Colors.green
                      ), ),),



                ],),
              )
,),




        Padding(padding:  EdgeInsets.only(left: 24,top: 32,right: 24,bottom: 0),
              child:
              Container(
                alignment: Alignment.centerRight,

                child:
                InkWell(
                    onTap: (){
                      if(isNotEmpty()){
                      Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>tutorLocations()));
                      }
                    },
                    child: Image(image: whiteNext,height: 70,width: 70,)

                ),),)


            ],


          ),
        ),
      );
  }
  String dropdownValue = 'Gender';

  String _value = 'Date Of Birth';

  Future _selectDate() async {
    DateTime picked = await showDatePicker(
        context: mContext,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(1900),
        lastDate: new DateTime(2020)
    );
    if(picked != null){

      setState(()  {_value = new DateFormat("yyyy-MM-dd").format(picked);
          birth = _value;}
      );
    }
  }



  bool isNotEmpty(){
    bool value = true;
    if(full_name.isEmpty ){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Name", 3422);
      value =  false;
    }
    else if (phone.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Phone", 3422);
      value = false;
    }

    else if (email.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Email", 3422);
      value = false;
    }

    else if (birth.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Date of Birth", 3422);
      value = false;
    }
    else if (gender.isEmpty){
      MessageDialogs().messageDialog(mContext, "Error", "Please Fill Your Gender", 3422);
      value = false;
    }



    return value;

  }


}
