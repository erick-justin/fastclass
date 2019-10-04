import 'dart:convert';

import 'package:flutter/material.dart';
import 'FObjects/Request.dart';
import 'Utilities/dialogs.dart';
import 'Utilities/systemConstants.dart';
import 'colors.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'Utilities/jsonExtrations.dart';
import 'package:intl/intl.dart';

BuildContext mContext;
List<Request> pending = new List();
List<Request> complete = new List();

// ignore: camel_case_types
class profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return profileScreen();
  }
}

// ignore: camel_case_types
class profileScreen extends State<profile> {

  void updateLists(String json){
    setState(() {
     pending = JsonExtraction().extractRequest(json,"pending");
     complete = JsonExtraction().extractRequest(json, "complete");
      

    });


  }
  @override
  void initState() {
    // TODO: implement initState
    createPost(serverUrl, loginData());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    mContext = context;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          // action button
          IconButton(
            icon: Image.asset("images/edit.png"),
            onPressed: () {
              showPasswordDialog();
            },
          ),
          // action button

          // overflow menu
        ],
        title: Text("Profile"),
        backgroundColor: appGreenColor,
      ),
      body: screen(),
    );
  }




  String loginData() {
    Map<String, dynamic> request = new Map();

    request['code'] = "201";
    request['user_id'] = userID;
    print(jsonEncode(request));
    return jsonEncode(request);
  }

  /// Fetches and decodes a JSON object represented as string
  /// Returns null if the API server is down, or the response is not JSON.
  Future<String> createPost(String url, String jsonString) async {
    print("requesr: " + url + " ," + jsonString);

    return http.post(url, body: jsonString).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400) {
        //MessageDialogs().dismissDialogs(mContext);
        MessageDialogs().messageDialog(mContext, "Error",
            "Seems There is a problem please try again later", 564);
        throw new Exception("Error while fetching data");
      }
      print(response.body);
      identifyResponse(response.body);
      return response.body;
    });
  }

// identifying the incoming response from the server
  void identifyResponse(String jsonString) {
    //MessageDialogs().dismissDialogs(mContext);
    if (jsonString != null) {
      var responseBody = jsonDecode(jsonString);
      int code = responseBody['code'];
      if (code == 200) {
      updateLists(jsonString);


      } else {
        MessageDialogs()
            .messageDialog(mContext, "Error!", responseBody['msg'], 54);
      }
    }
  }











}

Widget screen() {
  AssetImage assetImage = new AssetImage("images/profile_pic.png");
  return Material(
    child: Container(
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
              color: appGreenColor,
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      child:
                          CircleAvatar(radius: 60, backgroundImage: assetImage),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        fullName,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          phone_number,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )),
                    Container(
                        margin: EdgeInsets.all(8),
                        child: Text(
                          Email,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
                color: appBlueColor,
                constraints: BoxConstraints.expand(),
                child: recordView()),
          ),
        ],
      ),
    ),
  );
}

Future<void> showPasswordDialog() async {
  return showDialog<void>(
    context: mContext,

    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: appBlueColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        title: Text(
          "Change Password",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        content: SingleChildScrollView(
          child: Container(
            height: 200,
            width: 300,
            child: Column(
              children: <Widget>[
                Container(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24, top: 32, right: 24, bottom: 0),
                      child: new TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                          labelText: "Old Password",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                                color: appGreenColor, width: 2.0),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                                color: appGreenColor, width: 2.0),
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
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                            fontFamily: "Poppins", color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 24, top: 32, right: 24, bottom: 0),
                      child: new TextFormField(
                        obscureText: true,
                        decoration: new InputDecoration(
                          labelText: "New Password",
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                                color: appGreenColor, width: 2.0),
                          ),
                          focusedBorder: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                                color: appGreenColor, width: 2.0),
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
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                            fontFamily: "Poppins", color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Close",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          FlatButton(
            child: Text(
              "Send",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Widget recordView() {
  return DefaultTabController(
    length: 2,
    child: Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints.expand(height: 50),
          child: TabBar(indicatorColor: appGreenColor, tabs: [
            Tab(
              child: Text("PENDING",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
            Tab(
              child: Text("COMPLETED",
                  style: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ]),
        ),
        Expanded(
          child: Container(
            child: TabBarView(children: [
              Container(
                child:new ListView.builder(
                  itemCount: pending.length,
                    itemBuilder: (BuildContext context, int index) {
  return requestView(pending[index]);})
  
  ),

              Container(
  child:new ListView.builder(
              itemCount: complete.length,
                  itemBuilder: (BuildContext context, int index) {
                    return requestView(complete[index]);})),
            ]),
          ),
        )
      ],
    ),
  );
}

Widget requestView(Request re) {
  DateTime dateTime =  DateTime.parse(re.registered);
  String month = new DateFormat("MMM").format(dateTime);

  return Padding(
    padding: EdgeInsets.all(16),
    child: Card(
      elevation: 5,
      color: appGreenColor,
      child: Container(
       // height: 150,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.circular(50.0)
        ),
        child: Row(
          children: <Widget>[
        Padding(
        padding: EdgeInsets.all(8),
        child:
            Text(
             dateTime.day.toString(),
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ) ),
            ),
        Padding(
          padding: EdgeInsets.only(left: 0,top: 8,right: 8,bottom: 0),
          child:
            Text(

              month.toUpperCase()
              ,

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ) ),
            ),
            Expanded(

                child:


            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                child:

                Padding(
                  padding: EdgeInsets.all(8),
                  child:
                Text(
                   re.subject+"-"+re.topic,
                    textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ) ),
                ),),
                Container(
                    child:
                Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(

                      child:
                    Padding(
                      padding: EdgeInsets.all(8),
                      child:
                    Text(
                      re.mClass,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ) ),),
                    ),


                    Container(
                      alignment: Alignment.centerRight,
                     child:
                    Padding(
                      padding: EdgeInsets.all(8),
                      child:
                    Text(
                      "10,000/=",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                    ), ),
                  ],
                ))
                ,
                Padding(
                  padding: EdgeInsets.all(8),
                  child:Text(
                  "",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  )),



              ],
            )



            ) ]

        ),
      ),
    ),
  );
}


