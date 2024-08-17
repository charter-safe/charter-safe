import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isFavorite = false;
  //   final _suggestions = <WordPair>[];
  // final _saved = <WordPair>{};
  // final _biggerFont = TextStyle(fontSize: 18.0);
  final postList = [
    {
      "title": "Title 1",
      "color": Colors.amber,
    },
    {
      "title": "Title 2",
      "color": Colors.lightBlue,
    },
    {
      "title": "Title 3",
      "color": Colors.redAccent,
    },
  ];

  // Widget _buildRow(WordPair pair) {
  //   final isAlreadySaved = _saved.contains((pair));
  //   return ListTile(
  //     title: Text(
  //       pair.asPascalCase,
  //       style: _biggerFont,
  //     ),
  //     trailing: Icon(
  //       isAlreadySaved ? Icons.favorite : Icons.favorite_border,
  //       color: isAlreadySaved ? Colors.red : null,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    double widthRatio = deviceWidth / 375;
    double heightRatio = deviceHeight / 812;

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
        // drawer: Drawer(
        //   child: ListView(
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text("Drawer Header Part"),
        //       ),
        //       ListTile(
        //         title: Text("Menu 1"),
        //       ),
        //     ],
        //   ),
        // ),
        // body: Column(
        //   children: [
        //     Text(
        //       '검색 결과',
        //       style: TextStyle(color: Colors.black, letterSpacing: 2.0),
        //     ),
        //     SizedBox(
        //       height: 10.0,
        //     ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset('assets/images/cat.jpg',
                    width: 300, height: 200, fit: BoxFit.contain),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      '주소 ',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '가격',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '법원',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '매각기일',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '사건번호',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      '비고',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ),
                  // children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, right: 80),
                      child: Container(
                        width: widthRatio * 155,
                        height: heightRatio * 40,
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(vertical: heightRatio * 5),
                            width: widthRatio * 90,
                            decoration: ShapeDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              shadows: [
                                BoxShadow(
                                  color: Color(0x3F000000),
                                  blurRadius: 4,
                                  offset: Offset(0, 4),
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: widthRatio * 2),
                                Text(
                                  "리뷰",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'GowunBatang',
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(width: widthRatio * 2),
                                //   Icon(
                                //     Icons.edit,
                                //     color: Colors.white,
                                //     size: 13,
                                //   ),
                              ],
                            ),
                          ),
                          // ],
                        ),
                      ),
                    ),
                  ),
                ],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
    // ],
    // ),
    //       ),
    //     ],
    //   ),
    // ),
    // ],
    // ),
    // );
  }
}
