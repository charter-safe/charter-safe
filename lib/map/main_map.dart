// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
// import 'dart:async';

// void main() {
//   runApp(const MyApp());
// }

// void _currentLocation() async {
//   final GoogleMapController controller = await _controller.future;
//   Location location = Location();
//   final currentLocation = await location.getLocation();

//   controller.animateCamera(CameraUpdate.newCameraPosition(
//     CameraPosition(
//       target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
//       zoom: 18.0,
//     ),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(right: 60),
//                 child: Text(
//                   "안심하는 전세사기",
//                   style: TextStyle(fontSize: 15),
//                 ),
//               ),
//               Text(
//                 "전Safe",
//                 style: TextStyle(fontSize: 30),
//               ),
//             ],
//           ),
//           centerTitle: true,
//           leading: IconButton(
//             icon: Icon(Icons.menu),
//             iconSize: 35,
//             onPressed: () {
//               print('menu B');
//             },
//           ),
//           backgroundColor: Colors.grey,
//         ),
//         //실제 내용 들어갈 곳
//         body: Column(
//           // mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 20, bottom: 30),
//               child: Text(
//                 "지도",
//                 style: TextStyle(fontSize: 20),
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(
//                       // color: const Color.fromARGB(255, 255, 255, 255),
//                       borderRadius:
//                           BorderRadius.only(topRight: Radius.circular(10))),
//                   child: IconButton(
//                       icon: Padding(
//                         padding: const EdgeInsets.only(left: 60, top: 20),
//                         child: Icon(
//                           Icons.search,
//                           color: const Color.fromARGB(255, 0, 0, 0),
//                         ),
//                       ),
//                       onPressed: () {}),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10, top: 20),
//                   child: const SizedBox(
//                     width: 230,
//                     height: 40,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "원하는 주소를 입력해주세요",
//                         border: OutlineInputBorder(),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Container(
//               child: GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: const CameraPosition(
//                       target: LatLng(37.50508097213444, 126.95493073306663),
//                       zoom: 18)),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:async'; // Import for Completer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Completer<GoogleMapController> _controller = Completer();

  void _currentLocation() async {
    final GoogleMapController controller = await _controller.future;
    Location location = Location();
    final currentLocation = await location.getLocation();

    controller.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
        zoom: 18.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  borderRadius:
                  BorderRadius.only(topRight: Radius.circular(10)),
                ),
                child: IconButton(
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 60, top: 20),
                    child: Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  onPressed: () {},
                ),
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
          Expanded(
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: const CameraPosition(
                target: LatLng(37.50508097213444, 126.95493073306663),
                zoom: 18,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _currentLocation,
        child: Icon(Icons.my_location),
      ),
    );
  }
}
