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
        appBar: AppBar(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Text(
                  "안심하는 전세사기",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Text(
                "전Safe",
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.menu),
            iconSize: 35,
            onPressed: () {
              print('menu B');
            },
          ),
          backgroundColor: Colors.grey,
        ),
        //실제 내용 들어갈 곳
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                "지도",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius:
                          BorderRadius.only(topRight: Radius.circular(10))),
                  child: IconButton(
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 60, top: 20),
                        child: Icon(
                          Icons.search,
                          color: const Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                      onPressed: () {}),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: const SizedBox(
                    width: 230,
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "원하는 주소를 입력해주세요",
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 30),
              child: Text(
                "검색 결과 : OOOO시 OOO구 OO동", //검색 지역
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
