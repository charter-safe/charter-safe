import 'service.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordcheckController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  Service service = Service();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 화면'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "이메일"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "비밀번호"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: passwordcheckController,
              decoration: InputDecoration(hintText: "비밀번호 중복확인"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: yearController,
              decoration: InputDecoration(hintText: "생년"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: birthdayController,
              decoration: InputDecoration(hintText: "월일"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "이름"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: phonenumberController,
              decoration: InputDecoration(hintText: "전화번호"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(hintText: "주소"),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              child: const Text('전송'),
              onPressed: () {
                service.saveUser(
                    emailController.text,
                    passwordController.text,
                    passwordcheckController.text,
                    nameController.text,
                    phonenumberController.text,
                    addressController.text,
                    yearController.text,
                    birthdayController.text);
              },
            ),
          )
        ],
      )),
    );
  }
}
