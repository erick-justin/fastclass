
import 'dart:async';
import 'dart:convert' show json;
import 'dart:io';
import 'package:http/http.dart' as http;



class HttpConnection{
  final HttpClient _httpClient = HttpClient();


  /// Fetches and decodes a JSON object represented as string
  /// Returns null if the API server is down, or the response is not JSON.
  Future<String> createPost(String url, String jsonString) async {
    return http.post(url, body:jsonString ).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      print(response.body);
      return response.body;
    });
  }





}


