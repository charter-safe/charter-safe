import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> saveUser(
      String email,
      String password,
      String passwordcheck,
      String name,
      String phonenumber,
      String address,
      String year,
      String birthday) async {
    var uri = Uri.parse("http://10.0.2.2:8080/member/signup");
    Map<String, String> headers = {"Content-Type": "application/json"};

    Map data = {
      'email': email,
      'password': password,
      'passwordcheck': passwordcheck,
      'name': name,
      'phone_number': phonenumber,
      'address': address,
      'year': year,
      'birthday': birthday
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    print("${response.body}");

    return response;
  }
}
