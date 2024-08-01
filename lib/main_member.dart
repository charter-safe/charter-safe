import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        /*home : 첫번째 위젯을 뭘 보여줄것인가*/
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Text(
                  '안심하는 전세사기',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              Center(
                child: Text(
                  '전Safe',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 30),
              //   child: TextField(
              //     decoration: InputDecoration(
              //       labelText: "아이디",
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '아이디 입력',
                )),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호 입력',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호 확인',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '이름',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '전화번호',
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: TextField(
                    decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '주소',
                )),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("가입"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
