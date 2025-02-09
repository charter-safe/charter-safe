import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:home_safe_apps/document.dart';
import 'package:home_safe_apps/BaseAppBar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
    clientId: '074svwu57e', // Use your Naver Map Client ID.
    onAuthFailed: (error) {
      print("Naver Map authentication failed: $error");
    },
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String username = "사용자";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeColumn(username: username),
    );
  }
}

// Main Home Column Page
class HomeColumn extends StatelessWidget {
  final String username; //사용자 아이디

  const HomeColumn({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Baseappbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft, // 왼쪽 정렬
              child: Text(
                "$username님 반갑습니다:)",
                style: TextStyle(
                  fontFamily: 'Test',
                  fontSize: 25,
                  fontWeight: FontWeight.bold, // 굵게 설정
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft, // 왼쪽 정렬
              child: Text(
                "저희의 '전SAFE'를 이용해주셔서 감사합니다!",
                style: TextStyle(
                  fontFamily: 'Test',
                  fontSize: 25,
                  fontWeight: FontWeight.bold, // 굵게 설정
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Container(
                color: const Color.fromARGB(255, 239, 245, 242),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2, // 비율 조정 가능
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.55,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(253, 28, 100, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                                color: Colors.white, width: 4.0),
                            minimumSize: const Size(500, 50),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.apartment, size: 30),
                              SizedBox(height: 8), // 아이콘과 텍스트 사이 간격
                              Text(
                                '아파트',
                                style: TextStyle(
                                  fontFamily: 'Test',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10), // 버튼 간격
                    Expanded(
                      flex: 2, // 동일한 비율 적용
                      child: Container(
                        height: MediaQuery.of(context).size.width * 0.55,
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 10),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(253, 28, 100, 38),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                                color: Colors.white, width: 4.0),
                            minimumSize: const Size(500, 50),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.house, size: 30),
                              SizedBox(height: 8), // 아이콘과 텍스트 사이 간격
                              Text(
                                '오피스텔',
                                style: TextStyle(
                                  fontFamily: 'Test',
                                  fontSize: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Other Rows and Buttons
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ElevatedButton.icon(
                          label: const Text('전체 지도',
                              style:
                                  TextStyle(fontFamily: 'text', fontSize: 30)),
                          icon: const Icon(Icons.map,
                              size: 30, color: Colors.black),
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            shadowColor:
                                const Color.fromARGB(255, 174, 202, 188),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 28, 100, 38),
                                width: 4.0),
                            minimumSize: const Size(500, 50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ElevatedButton.icon(
                          label: const Text('필요한 서류 체크',
                              style:
                                  TextStyle(fontFamily: 'text', fontSize: 30)),
                          icon: const Icon(Icons.document_scanner,
                              size: 30, color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Documentpage(),
                              ),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            shadowColor:
                                const Color.fromARGB(255, 174, 202, 188),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: const BorderSide(
                                color: Color.fromARGB(255, 28, 100, 38),
                                width: 4.0),
                            minimumSize: const Size(500, 50),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        label: const Text('전세사기 예방하는 방법',
                            style: TextStyle(fontFamily: 'text', fontSize: 30)),
                        icon: const Icon(Icons.sentiment_satisfied_alt,
                            size: 30, color: Colors.black),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 28, 100, 38),
                              width: 4.0),
                          minimumSize: const Size(500, 50),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
