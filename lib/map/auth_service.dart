//로그인 기능을 담당하는 AuthService

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//ChangeNotifier : 인증 상태 변경 시 화면 새로고침을 위해 상속
class AuthService extends ChangeNotifier {
  String? _token;

  String? get token => _token;

  Future<void> signUp({
    required String email,
    required String password,
    required String passwordcheck,
    required String name,
    required String number,
    required String address,
    required Function() onSuccess,
    required Function(String err) onError,
  }) async {
    //회원가입
    // 이메일 및 비밀번호 등 입력 여부 확인
    if (email.isEmpty) {
      onError("이메일을 입력해 주세요.");
      return;
    } else if (password.isEmpty) {
      onError("비밀번호를 입력해 주세요.");
      return;
    } else if (passwordcheck.isEmpty) {
      onError("비밀번호 확인란을 입력해 주세요.");
      return;
    } else if (name.isEmpty) {
      onError("이름을 입력해 주세요.");
      return;
    } else if (number.isEmpty) {
      onError("전화번호를 -와 같이 기입하여 입력해 주세요.");
      return;
    } else if (address.isEmpty) {
      onError("주소를 입력해 주세요.");
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('https://your-spring-server.com/api/auth/signup'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'passwordcheck': passwordcheck,
          'name': name,
          'number': number,
          'address': address,
        }),
      );

      //여기 아래 부분을 수정해야할지 여부 판단하기(5회차)
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
        Uri.parse('https://your-spring-server.com/api/auth/signin'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': email, 'password': password}),
      );

      if (response.statusCode == 200) {
        final responseBody = json.decode(response.body);
        _token = responseBody['token']; // 토큰 저장
        onSuccess();
        notifyListeners(); // 로그인 상태 변경 알림
      } else {
        final responseBody = json.decode(response.body);
        onError(responseBody['message'] ?? 'Unknown error occurred.');
      }
    } catch (e) {
      onError('An error occurred: $e');
    }
  }

  Future<void> signOut() async {
    // 로그아웃 로직: 토큰 삭제 및 상태 업데이트
    _token = null;
    notifyListeners(); // 로그인 상태 변경 알림
  }
}
