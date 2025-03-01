import 'package:flutter/material.dart';

class FindIdPage extends StatefulWidget {
  const FindIdPage({Key? key}) : super(key: key);

  @override
  _FindIdPageState createState() => _FindIdPageState();
}

class _FindIdPageState extends State<FindIdPage> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('아이디 찾기'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 이메일 입력 필드
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: '이메일',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                ),
              ),
            ),

            // 아이디 찾기 버튼
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // 버튼 색상
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("아이디 찾기",
                    style: TextStyle(fontSize: 18, color: Colors.white)),
                onPressed: () {
                  // 이메일을 통해 아이디 찾기 로직을 구현할 수 있습니다.
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('아이디 찾기 요청이 완료되었습니다.')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
