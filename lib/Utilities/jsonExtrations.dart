


import 'dart:convert';

import 'package:flutter_app2/FObjects/Request.dart';

class JsonExtraction {




    List<Request> extractRequest(String json,String type){
       List<Request>requests = new List();
        var responseBody = jsonDecode(json);
        List requestArray = responseBody[type];
        for(int i = 0; i<requestArray.length;i++){
           var request = requestArray[i];
           requests.add(new Request(request['request_id'],
               request['user_id'],
               request['curriculum'],
               request['class'],
               request['subject'],
               request['topic'],
               request['status'],
               request['registered']));

        }

        return requests;


    }

}