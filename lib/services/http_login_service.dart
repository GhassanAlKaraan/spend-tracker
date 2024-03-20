// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MyHttpService {

  late SharedPreferences prefs;

  Future<bool> login(String username, String password) async {
    prefs = await SharedPreferences.getInstance();

    var reqBody = {'username':username, 'password': password};

    // const String loginEndpoint = 'http://127.0.0.1/forex-alchemists/public/api/auth/login';
    const String loginEndpoint = 'https://dummyjson.com/auth/login';

    var response = await http.post(Uri.parse(loginEndpoint), headers: {'Content-Type':'application/json'},
    body: jsonEncode(reqBody)
    );

   var jsonResponse = jsonDecode(response.body); // {'data': {}}

    if (response.statusCode == 200) {

      // Get Token
      var myToken = jsonResponse['token'];

      prefs.setString('token', myToken);


      print(response.reasonPhrase);
      return true;
    } else {
      print(response.reasonPhrase);
      return false;
    }
  }

}


