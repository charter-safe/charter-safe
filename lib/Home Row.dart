import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:home_safe_apps/BaseAppBar.dart';
import 'package:home_safe_apps/document.dart';
import 'package:home_safe_apps/map/change.dart';
import 'package:home_safe_apps/review/list_screen.dart';
import 'map/map.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
    clientId: '5qg6epilfh', // Use your Naver Map Client ID.
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: Baseappbar(),
        body: Builder(
          builder: (context) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Container(
                    color: Color.fromARGB(255, 239, 245, 242),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: MediaQuery.of(context).size.width * 0.55,
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 10),
                            child: ElevatedButton.icon(
                              label: const Text('아파트'),
                              icon: const Icon(Icons.apartment, size: 40),
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                textStyle: TextStyle(fontSize: 25.0),
                                foregroundColor: Colors.white,
                                backgroundColor:
                                    Color.fromARGB(255, 28, 100, 38),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                side:
                                    BorderSide(color: Colors.white, width: 4.0),
                                minimumSize: const Size(500, 50),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Add spacing between buttons
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                child: ElevatedButton.icon(
                                  label: const Text('주택'),
                                  icon: const Icon(Icons.villa, size: 40),
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 25.0),
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 28, 100, 38),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    side: BorderSide(
                                        color: Colors.white, width: 4.0),
                                    minimumSize: const Size(500, 50),
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 10),
                                height:
                                    MediaQuery.of(context).size.width * 0.25,
                                child: ElevatedButton.icon(
                                  label: const Text('오피스텔'),
                                  icon: const Icon(Icons.house, size: 40),
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    textStyle: TextStyle(fontSize: 25.0),
                                    foregroundColor: Colors.white,
                                    backgroundColor:
                                        Color.fromARGB(255, 28, 100, 38),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    side: BorderSide(
                                        color: Colors.white, width: 4.0),
                                    minimumSize: const Size(500, 50),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  // height: MediaQuery.of(context).size.width * 0.15,
                  // width: MediaQuery.of(context).size.height * 1,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ElevatedButton.icon(
                          label: const Text('전체 지도'),
                          icon: const Icon(Icons.map,
                              size: 40, color: Colors.black),
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 25.0),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromARGB(255, 174, 202, 188),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: BorderSide(
                                color: Color.fromARGB(255, 28, 100, 38),
                                width: 4.0),
                            minimumSize: const Size(500, 50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: ElevatedButton.icon(
                          label: const Text('필요한 서류 체크'),
                          icon: const Icon(Icons.document_scanner,
                              size: 40, color: Colors.black),
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            textStyle: TextStyle(fontSize: 25.0),
                            foregroundColor: Colors.black,
                            backgroundColor: Colors.white,
                            shadowColor: Color.fromARGB(255, 174, 202, 188),
                            elevation: 10.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            side: BorderSide(
                                color: Color.fromARGB(255, 28, 100, 38),
                                width: 4.0),
                            minimumSize: const Size(500, 50),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        label: const Text('전세사기 예방하는 방법'),
                        icon: const Icon(Icons.sentiment_satisfied_alt,
                            size: 40, color: Colors.black),
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 25.0),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          // shadowColor: Color.fromARGB(255, 174, 202, 188),
                          // elevation: 10.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: BorderSide(
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
          ),
        ),
        // ),
        bottomNavigationBar: const BottomAppBarWidget(),
      ),
    );
  }
}
