import 'package:bucket_list_with_firebase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("회원가입")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                controller: emailController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이메일',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                  controller: passwordCheckController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '비밀번호 확인',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                  controller: nameController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이름',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                  controller: numberController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '전화번호',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: TextField(
                  controller: addressController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '주소',
                  )),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("가입"),
              onPressed: () {
                // 회원가입 로직 구현
                context.read<AuthService>().signUp(
                      email: emailController.text,
                      password: passwordController.text,
                      passwordcheck: passwordCheckController.text,
                      name: nameController.text,
                      number: numberController.text,
                      address: addressController.text,
                      onSuccess: () {
                        // 회원가입 성공 처리
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("회원가입 성공"),
                        ));

                        // 로그인 페이지로 이동
                        Navigator.pop(context);
                      },
                      onError: (err) {
                        // 회원가입 실패 처리
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("회원가입 실패: $err"),
                        ));
                      },
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
