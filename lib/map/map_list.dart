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
            GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 12.0,
              ),
              children: [
                postContainer(title: "Title 1", colorName: Colors.amber),
                postContainer(title: "Title 2", colorName: Colors.blue),
                postContainer(title: "Title 3", colorName: Colors.red),
                postContainer(title: "Title 4", colorName: Colors.lightGreen),
                postContainer(title: "Title 5", colorName: Colors.purpleAccent),
                postContainer(title: "Title 6", colorName: Colors.indigoAccent),
                postContainer(
                    title: "Title 7", colorName: Colors.deepOrangeAccent),
                postContainer(title: "Title 8", colorName: Colors.greenAccent),
                // postContainer(title: "Title 1", colorName: Colors.amber),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container postContainer(
      {String title = "Title", Color colorName = Colors.white}) {
    return Container(
      // width: MediaQuery.of(context).size.width,
      height: 180,
      // padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
              height: 20,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              child: Text(title)),
          Container(
            height: 190,
            color: colorName,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/cat.jpg',
                    width: 200, height: 100, fit: BoxFit.fitWidth),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '주소 ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '가격',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '법원',
                      style: TextStyle(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        children: [
                          Spacer(),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isFavorite = !isFavorite;
                              });
                            },
                            child: Row(
                              children: [
                                Icon(
                                  isFavorite
                                      ? CupertinoIcons.heart_fill
                                      : CupertinoIcons.heart,
                                  color:
                                      isFavorite ? Colors.pink : Colors.black,
                                  size: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 110),
                                  child: Text(
                                    '자세히 보기',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
