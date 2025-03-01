import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Service {
  Future<http.Response> saveUser(
    String email,
    String password,
    String confirmPassword, // 변경: passwordcheck -> confirmPassword
    String name,
    String phoneNumber,
    String address,
    String year,
    String birthday,
  ) async {
    var uri =
        Uri.parse("http://your-server-address/member/signup"); // 실제 서버 URL로 변경
    Map<String, String> headers = {"Content-Type": "application/json"};

    Map data = {
      'email': email,
      'password': password,
      'confirmPassword':
          confirmPassword, // 변경: passwordcheck -> confirmPassword
      'name': name,
      'phoneNumber': phoneNumber,
      'address': address,
      'year': year,
      'birthday': birthday,
    };
    var body = json.encode(data);
    var response = await http.post(uri, headers: headers, body: body);

    return response;
  }
}
