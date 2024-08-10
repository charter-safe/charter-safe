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
        body: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 30, left: 30),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(70),
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text('지도'),
                        ),
                      ),
                    ),
                  ],
                ),
                // ],
                Column(
                  children: [
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, right: 30, left: 30),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(
                                left: 70, right: 70, top: 20, bottom: 20),
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text('서류'),
                        ),
                      ),
                    ),
                    Container(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 25, right: 30, left: 30),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.only(
                                left: 65, right: 65, top: 20, bottom: 20),
                            backgroundColor: Colors.white,
                            side: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: Text('예방법'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            //자동으로 넘어가는 광고 배너 같은 거 넣기
          ],
        ),
      ),
    );
  }
}
