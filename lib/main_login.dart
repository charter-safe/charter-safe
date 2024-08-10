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
          padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 50),
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
                    labelText: '아이디',
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '비밀번호',
                    )),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text('회원가입'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('아이디 찾기'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('비밀번호 찾기'),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("로그인"),
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: Text("구글 계정으로 로그인",
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ),
              ),
              Center(
                // child: Padding(
                //   padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[900],
                    ),
                    child: Text("네이버 계정으로 로그인",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              // ),
              Center(
                // child: Padding(
                //   padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[800],
                    ),
                    child: Text("카카오 계정으로 로그인",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}
