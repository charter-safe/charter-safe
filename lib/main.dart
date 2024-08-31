import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {2
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
        //     child: ListView(
        //   padding: EdgeInsets.zero,
        //   children: [
        //     const DrawerHeader(
        //       decoration: BoxDecoration(
        //         color: Colors.blue,
        //       ),
        //       child: Text("Drawer Header Part"),
        //     ),
        //     ListTile(
        //       title: Text("Menu 1"),
        //     ),
        //   ],
        // )),
        // body: Column(
        //   children: [
        //     Row(
        //       children: [
        //         Column(
        //           children: [
        //             Container(
        //               child: Padding(
        //                 padding: const EdgeInsets.only(top: 30, left: 30),
        //                 child: TextButton(
        //                   onPressed: () {},
        //                   style: TextButton.styleFrom(
        //                     padding: EdgeInsets.all(70),
        //                     backgroundColor: Colors.white,
        //                     side: BorderSide(
        //                       color: Colors.black,
        //                       width: 2,
        //                     ),
        //                   ),
        //                   child: Text('지도'),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //         // ],
        //         Column(
        //           children: [
        //             Container(
        //               child: Padding(
        //                 padding:
        //                     const EdgeInsets.only(top: 30, right: 30, left: 30),
        //                 child: TextButton(
        //                   onPressed: () {},
        //                   style: TextButton.styleFrom(
        //                     padding: EdgeInsets.only(
        //                         left: 70, right: 70, top: 20, bottom: 20),
        //                     backgroundColor: Colors.white,
        //                     side: BorderSide(
        //                       color: Colors.black,
        //                       width: 2,
        //                     ),
        //                   ),
        //                   child: Text('서류'),
        //                 ),
        //               ),
        //             ),
        //             Container(
        //               child: Padding(
        //                 padding:
        //                     const EdgeInsets.only(top: 25, right: 30, left: 30),
        //                 child: TextButton(
        //                   onPressed: () {},
        //                   style: TextButton.styleFrom(
        //                     padding: EdgeInsets.only(
        //                         left: 65, right: 65, top: 20, bottom: 20),
        //                     backgroundColor: Colors.white,
        //                     side: BorderSide(
        //                       color: Colors.black,
        //                       width: 2,
        //                     ),
        //                   ),
        //                   child: Text('예방법'),
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ],
        //     ),

        //     // //자동으로 넘어가는 광고 배너 같은 거 넣기(outo Swiper)
        //     // Container(
        //     //   // color: Color(0xFFEDF0F4),
        //     //   height: 280,
        //     //   child: Padding(
        //     //     padding: EdgeInsets.only(top: 50),
        //     //     child: Swiper(
        //     //       autoplay: true,
        //     //       scale: 0.9,
        //     //       viewportFraction: 0.8,
        //     //       pagination:
        //     //       SwiperPagination(alignment: Alignment.bottomRight),
        //     //       itemCount: imgList.length,
        //     //       itemBuilder: (BuildContext context, int index) {
        //     //         return Image.network(imgList[index]);
        //     //       },
        //     //           ),
        //     //         ),
        //     //       ),
        //   ],
        // ),
      ),
    );
  }
}
