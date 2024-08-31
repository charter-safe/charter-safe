// // import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SignupScreen(),
// //     );
// //   }
// // }

// // class SignupScreen extends StatefulWidget {
// //   @override
// //   _SignupScreenState createState() => _SignupScreenState();
// // }

// // class _SignupScreenState extends State<SignupScreen> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController =
// //       TextEditingController();
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController phoneNumberController = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();

// //   Future<void> signup() async {
// //     final url = Uri.parse(
// //         'http://localhost:8080/api/member/signup'); // Spring Boot 서버의 URL
// //     final response = await http.post(
// //       url,
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode({
// //         'email': emailController.text,
// //         'password': passwordController.text,
// //         'confirmPassword': confirmPasswordController.text,
// //         'name': nameController.text,
// //         'phoneNumber': phoneNumberController.text,
// //         'address': addressController.text,
// //       }),
// //     );

// //     if (response.statusCode == 200) {
// //       // 성공적으로 회원가입이 완료되었을 때
// //       final jsonResponse = jsonDecode(response.body);
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Signup Successful')));
// //     } else {
// //       // 오류 처리
// //       ScaffoldMessenger.of(context).showSnackBar(
// //           SnackBar(content: Text('Signup Failed: ${response.body}')));
// //     }
// //   }

// //   // This widget is the root of your application.
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: Scaffold(
// //         /*home : 첫번째 위젯을 뭘 보여줄것인가*/
// //         appBar: AppBar(),
// //         body: Padding(
// //           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.only(left: 50),
// //                 child: Text(
// //                   '안심하는 전세사기',
// //                   style: TextStyle(
// //                     fontSize: 15,
// //                   ),
// //                 ),
// //               ),
// //               Center(
// //                 child: Text(
// //                   '전Safe',
// //                   style: TextStyle(fontSize: 40),
// //                 ),
// //               ),
// //               // Padding(
// //               //   padding: const EdgeInsets.only(top: 30),
// //               //   child: TextField(
// //               //     decoration: InputDecoration(
// //               //       labelText: "아이디",
// //               //     ),
// //               //   ),
// //               // ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 50),
// //                 child: TextField(
// //                     decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: '아이디 입력',
// //                 )),
// //               ),

// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: TextField(
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       border: OutlineInputBorder(),
// //                       labelText: '비밀번호 입력',
// //                     )),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: TextField(
// //                     obscureText: true,
// //                     decoration: InputDecoration(
// //                       border: OutlineInputBorder(),
// //                       labelText: '비밀번호 확인',
// //                     )),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: TextField(
// //                     decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: '이름',
// //                 )),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: TextField(
// //                     decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: '전화번호',
// //                 )),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 10),
// //                 child: TextField(
// //                     decoration: InputDecoration(
// //                   border: OutlineInputBorder(),
// //                   labelText: '주소',
// //                 )),
// //               ),
// //               Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.only(top: 20),
// //                   child: ElevatedButton(
// //                     onPressed: signup,
// //                     child: Text("가입"),
// //                   ),
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // void main() {
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       home: SignupScreen(),
// //     );
// //   }
// // }

// // class SignupScreen extends StatefulWidget {
// //   @override
// //   _SignupScreenState createState() => _SignupScreenState();
// // }

// // class _SignupScreenState extends State<SignupScreen> {
// //   final TextEditingController emailController = TextEditingController();
// //   final TextEditingController passwordController = TextEditingController();
// //   final TextEditingController confirmPasswordController =
// //       TextEditingController();
// //   final TextEditingController nameController = TextEditingController();
// //   final TextEditingController phoneNumberController = TextEditingController();
// //   final TextEditingController addressController = TextEditingController();

// //   Future<void> signup() async {
// //     // 서버의 실제 IP 주소로 변경하세요.
// //     final url = Uri.parse('http://192.168.x.x:8080/api/member/signup');

// //     // 전송할 데이터
// //     final data = {
// //       'email': emailController.text,
// //       'password': passwordController.text,
// //       'confirmPassword': confirmPasswordController.text,
// //       'name': nameController.text,
// //       'phoneNumber': phoneNumberController.text,
// //       'address': addressController.text,
// //     };

// //     // 디버그: 전송할 데이터 출력
// //     print('전송 데이터: $data');

// //     // 요청 보내기
// //     final response = await http.post(
// //       url,
// //       headers: {'Content-Type': 'application/json'},
// //       body: jsonEncode(data),
// //     );

// //     // 서버의 응답 처리
// //     if (response.statusCode == 200) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('가입 성공')),
// //       );
// //     } else {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('가입 실패: ${response.body}')),
// //       );
// //       // 디버그: 서버의 응답 출력
// //       print('서버 응답: ${response.body}');
// //     }
// //   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Text(
//                 '전안전',
//                 style: TextStyle(fontSize: 40),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '아이디 입력',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '비밀번호 입력',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: TextField(
//                 controller: confirmPasswordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '비밀번호 확인',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '이름',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: TextField(
//                 controller: phoneNumberController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '전화번호',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: TextField(
//                 controller: addressController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '주소',
//                 ),
//               ),
//             ),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 20),
//                 child: ElevatedButton(
//                   onPressed: signup, // 가입 버튼 클릭 시 호출
//                   child: Text("가입"),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
