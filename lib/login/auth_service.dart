import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthService extends ChangeNotifier {
  String? _token;

  String? get token => _token;

  Future<void> signUp({
    required String email,
    required String password,
    required String confirmPassword,
    required String name,
    required String phoneNumber,
    required String address,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError("이메일을 입력해 주세요.");
      return;
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해 주세요.");
      return;
    } else if (confirmPassword.isEmpty) {
      // 변경: passwordcheck -> confirmPassword
      onError("비밀번호 확인란을 입력해 주세요.");
      return;
    } else if (password != confirmPassword) {
      onError("비밀번호가 일치하지 않습니다.");
      return;
    } else if (name.isEmpty) {
      onError("이름을 입력해 주세요.");
      return;
    } else if (phoneNumber.isEmpty) {
      onError("전화번호를 입력해 주세요.");
      return;
    } else if (address.isEmpty) {
      onError("주소를 입력해 주세요.");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://your-server-address.com/signup'), // 실제 서버 주소로 변경
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'confirmPassword':
              confirmPassword, // 변경: passwordcheck -> confirmPassword
          'name': name,
          'phoneNumber': phoneNumber,
          'address': address,
        }),
      );

      if (response.statusCode == 200) {
        onSuccess();
      } else {
        final responseBody = json.decode(response.body);
        onError(responseBody['message'] ?? 'Unknown error occurred.');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    if (email.isEmpty) {
      onError('이메일을 입력해주세요.');
      return;
    } else if (password.isEmpty) {
      onError('비밀번호를 입력해주세요.');
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://your-server-address.com/api/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _token = responseBody['token'];
        onSuccess();
        notifyListeners();
      } else {
        final responseBody = json.decode(response.body);
        onError(responseBody['message'] ?? 'Unknown error occurred.');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> signOut() async {
    _token = null;
    notifyListeners();
  }
}
