import 'dart:async';
// import 'package:bucket_list_with_firebase/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:home_safe_apps/Home.dart';
import 'package:home_safe_apps/document.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance
      .initialize(clientId: '5qg6epilfh'); // Replace with your actual client ID
  runApp(Mappage());
}

class Mappage extends StatefulWidget {
  @override
  State<Mappage> createState() => _Mappage();
}

class _Mappage extends State<Mappage> {
  late Future<void> _initializeNaverMap;

  @override
  void initState() {
    super.initState();
    _initializeNaverMap = NaverMapSdk.instance.initialize(
        clientId: '5qg6epilfh'); // Replace with your actual client ID
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60),
                child: Center(child: Text("지도")),
              ),
            ],
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            iconSize: 35,
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          backgroundColor: Colors.grey,
        ),
        body: Column(children: [
          Mappage(),
          //MarkerList(),
        ]),
        bottomNavigationBar: Builder(
          builder: (context) => BottomAppBar(
            color: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.home_filled, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.map, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Mappage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.document_scanner, size: 40),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Documentpage(),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.person, size: 40),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'package:bucket_list_with_firebase/MapWidget.dart';
// import 'package:bucket_list_with_firebase/MarkerList.dart';
// import 'package:flutter/material.dart';
// import 'MapModel.dart';
// // import 'package:naver_map_plugin/naver_map_plugin.dart';
// import 'package:provider/provider.dart';

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Flutter Weather App'),
//       ),
//       body: Column(
//         children: [
//           MapWidget(),
//           MarkerList(),
//         ],
//       ),
//     );
//   }
// }