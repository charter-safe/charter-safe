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
              Container(
                margin: EdgeInsets.only(top: 100, left: 20),
                child: Row(
                  children: [
                    Text(
                      '이름',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontFamily: 'GowunBatang',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.40,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 60, top: 20, bottom: 20),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      margin: EdgeInsets.only(left: 20),
                      width: 200,
                      height: 30,
                      child: TextFormField(
                        // TextFormField의 속성들 설정
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '이메일을 입력하세요',
                          hintStyle: TextStyle(
                            color: Color(0x000000),
                            fontSize: 13,
                            fontFamily: 'GowunBatang',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.33,
                          ),
                          // 다른 속성들 설정
                        ),
                        // controller: _emailController,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(left: 20),
                child: Row(children: [
                  Text(
                    '휴대전화',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: 'GowunBatang',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.40,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    margin: EdgeInsets.only(left: 20),
                    width: 200,
                    height: 30,
                    child: TextFormField(
                      obscureText: true,
                      // TextFormField의 속성들 설정
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '비밀번호를 입력하세요',
                        hintStyle: TextStyle(
                          color: Color(0x000000),
                          fontSize: 13,
                          fontFamily: 'GowunBatang',
                          fontWeight: FontWeight.w700,
                          height: 0,
                          letterSpacing: -0.33,
                        ),
                        // 다른 속성들 설정
                      ),
                      // controller: _passwordController,
                    ),
                  ),
                ]),
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
