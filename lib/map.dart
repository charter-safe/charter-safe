// import 'package:bucket_list_with_firebase/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Mappage extends StatefulWidget {
//   const Mappage({Key? key}) : super(key: key);

//   @override
//   _Map createState() => _Map();
// }

// class _Map extends State<Mappage> {
//   TextEditingController regionController = TextEditingController(); //지역
//   TextEditingController guController = TextEditingController(); //구
//   TextEditingController dongController = TextEditingController(); //동

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("지도")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                 controller: regionController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '지역',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: guController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '구',
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: dongController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '동',
//                   )),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(child: Text("검색"), onPressed: () {}
//                 // 회원가입 로직 구현
//                 // context.read<AuthService>().signUp(
//                 //       email: emailController.text,
//                 //       password: passwordController.text,
//                 //       passwordcheck: passwordCheckController.text,
//                 //       name: nameController.text,
//                 //       number: numberController.text,
//                 //       address: addressController.text,
//                 //       onSuccess: () {
//                 //         // 회원가입 성공 처리
//                 //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 //           content: Text("회원가입 성공"),
//                 //         ));

//                 //         // 로그인 페이지로 이동
//                 //         Navigator.pop(context);
//                 //       },
//                 //       onError: (err) {
//                 //         // 회원가입 실패 처리
//                 //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                 //           content: Text("회원가입 실패: $err"),
//                 //         ));
//                 ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';

void main() async {
  await _initialize();
  runApp(const NaverMapApp());
}

// 지도 초기화하기
Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: '5qg6epilfh', // 클라이언트 ID 설정
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed"));
}

class NaverMapApp extends StatelessWidget {
  const NaverMapApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return MaterialApp(
      home: Scaffold(
        body: NaverMap(
          options: const NaverMapViewOptions(
            indoorEnable: true, // 실내 맵 사용 가능 여부 설정
            locationButtonEnable: false, // 위치 버튼 표시 여부 설정
            consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 여부 설정
          ),
          onMapReady: (controller) async {
            // 지도 준비 완료 시 호출되는 콜백 함수
            mapControllerCompleter
                .complete(controller); // Completer에 지도 컨트롤러 완료 신호 전송
            log("onMapReady", name: "onMapReady");
          },
        ),
      ),
    );
  }
}
