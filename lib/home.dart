
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utilities/preferenceFunctions.dart';
import 'colors.dart';
import 'tutorRequest.dart';
import 'tutorForm.dart';
import 'profile.dart';


//global variables
BuildContext mContext;
AssetImage whiteNext = AssetImage("images/next_white.png");
AssetImage greenNext = AssetImage("images/next_green.png");
SharedPreferences preferences;
String fullName = "";
String userID = "";
// ignore: non_constant_identifier_names
String phone_number = "";
// ignore: non_constant_identifier_names
String Email = "";


// ignore: camel_case_types
class homeScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return TheScreen();
  }

  }









class TheScreen extends State<homeScreen>{


  @override
  Widget build(BuildContext context) {
    mContext = context;
    getFirstName();



    return   Scaffold(

        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor:  Color.fromRGBO(4, 45, 106, 1),
          actions: <Widget>[
            // action button
            IconButton(
              icon: Icon(Icons.person_pin,size: 40,color:  Color.fromRGBO(21, 151, 91, 1),),
              onPressed: () {
                print("hello");
                Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>profile()));


              },
            ),
            Container(
              child:
              Icon(null,size: 10,color:  Color.fromRGBO(21, 151, 91, 1),),

            ),
          ],
        ),

        body:screenWidget()
    );
  }

  void setUserDetails(String s, String userId, String phone, String email){
    setState(() {
      fullName = s;
      userID = userId;
       phone_number = phone;
      Email = email;

    });
  }

  Future<void> getFirstName() async {
    preferences  = await SharedPreferences.getInstance();
    setUserDetails(preferences.get("username"),preferences.get("user_id"),preferences.get("phone_number"),preferences.get("email"));




  }

}




Widget screenWidget(){



    return Material(
      child: Container(
          color: appBlueColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              flex: 4,
              child:Container(
                padding: EdgeInsets.only(left: 48,top: 56,right: 0,bottom: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Container(

                      padding: EdgeInsets.only(left: 0,top: 8,right: 0,bottom: 0),

                      child:Text("Hello "+fullName.split(" ")[0]+"!!",
                        style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                    )
                    , Container(
                      padding: EdgeInsets.only(left: 0,top: 8,right: 0,bottom: 0),
                      //color: Colors.pink,
                      child:Text("See what you can",
                        style: TextStyle(fontSize: 23,color: appGreenColor,fontWeight: FontWeight.bold),),
                    )
                    ,  Container(
                      padding: EdgeInsets.only(left: 0,top: 8,right: 0,bottom: 0),
                      //color: Colors.pink,
                      child:Text("learn Today",
                        style: TextStyle(fontSize: 23,color: appGreenColor,fontWeight: FontWeight.bold),),
                    )
,
            Container(

              //  alignment: Alignment.centerRight,
              //color: Colors.pink,
        padding: EdgeInsets.only(left:184 ,top: 0,right: 0,bottom: 0),

        //color: Colors.pink,

              child:
              InkWell(
                  child:Image(image: whiteNext,height: 70,width: 70,),
                onTap: (){
                  Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>tutorForm()));

                }
                ,
      ),)




                  ],

                ),
              ),
            ),
            Flexible(
              flex: 3,
              child:Container(
                padding: EdgeInsets.only(left: 48,top: 56,right: 0,bottom: 0),
                child: ListView(
                  children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(left: 0,top: 8,right: 0,bottom: 0),

                      child:Text("Become A",
                        style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                    )
                    ,
                      Container(
                      padding: EdgeInsets.only(left: 0,top: 8,right: 0,bottom: 0),
                      //color: Colors.pink,
                      child:Text("Tutor",
                        style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),),
                    )
                    ,
                    Container(
                        padding: EdgeInsets.only(left:5,top: 0,right: 0,bottom: 0),
                        child:
                            InkWell(
                              onTap: (){
                                Navigator.push(mContext, MaterialPageRoute(builder: (mContext)=>tutorRequest()));
                              },
                                child: Image(image: greenNext,height: 70,width: 70,)

                    ),)




                  ],

                ),
              ),
            )
          ],
        ),

      ),);
}


