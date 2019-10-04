

import 'package:shared_preferences/shared_preferences.dart';



class Preference {


  Future<String> getFirstName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String fullName = preferences.get("username");
    return fullName.split(" ")[0];
  }

}