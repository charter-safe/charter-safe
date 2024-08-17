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
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
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
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 20),
                child: Text(
                  '비밀번호 변경',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '새 비밀번호 입력',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 20),
                    child: const SizedBox(
                      width: 180,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '새 비밀번호 확인',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 20),
                    child: const SizedBox(
                      width: 180,
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("비밀번호 변경"),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
