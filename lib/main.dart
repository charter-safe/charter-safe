// import 'package:bucket_list_with_firebase/signuppage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_safe_apps/login/member.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final token = context.read<AuthService>().token;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: '온글잎 박다현체',
      ),
      debugShowCheckedModeBanner: false,
      home: token == null ? LoginPage() : MyApp(),
    );
  }
}

/// 로그인 페이지
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // TextEditingController passwordcheckController = TextEditingController();
  // TextEditingController nameController = TextEditingController();
  // TextEditingController numberController = TextEditingController();
  // TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return Scaffold(
          // appBar: PreferredSize(
          //   preferredSize: Size.fromHeight(200),
          //   child: Padding(
          //     padding: const EdgeInsets.only(top: 30.0),
          //     child: AppBar(
          //       title:
          //           Image.asset('assets/logo(2).png', width: 500, height: 100),
          //       backgroundColor: Color.fromARGB(255, 28, 100, 38),
          //     ),
          //   ),
          // ),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Container(
                      child: Image.asset('assets/logo(5).png',
                          fit: BoxFit.fitHeight),
                      width: 100,
                      height: 250
                      // color: Color.fromARGB(255, 28, 100, 38),
                      ),
                ),

                //이메일
                // TextField(
                //   controller: emailController,
                //   decoration: InputDecoration(hintText: "이메일"),
                // ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '이메일',
                  ),
                  // style: TextStyle(
                  //     fontFamily: 'Jalnan2TTF',
                  //     fontSize: 20,
                  //     fontWeight: FontWeight.bold),
                ),

                /// 비밀번호
                // TextField(
                //   controller: passwordController,
                //   obscureText: true, // 비밀번호 안보이게
                //   decoration: InputDecoration(hintText: "비밀번호"),
                // ),
                // SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '비밀번호',
                      )),
                ),

                /// 로그인 버튼
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    child: Text("로그인", style: TextStyle(fontSize: 21)),
                    onPressed: () {
                      // 로그인
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          // 로그인 성공
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("로그인 성공"),
                          ));

                          // HomePage로 이동
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        onError: (err) {
                          // 에러 발생
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                  ),
                ),

                /// 회원가입 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: Text("회원가입", style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                        //   // 회원가입
                        //   // authService.signUp(
                        //   //   email: emailController.text,
                        //   //   password: passwordController.text,
                        //   //   passwordcheck: passwordcheckController.text,
                        //   //   name: nameController.text,
                        //   //   number: numberController.text,
                        //   //   address: addressController.text,
                        //   onSuccess:
                        //   () {
                        //     // 회원가입 성공
                        //     print("회원가입 성공");
                        //   };
                        //   onError:
                        //   (err) {
                        //     // 에러 발생
                        //     print("회원가입 실패 : $err");
                        //   };
                      },
                    ),
                    TextButton(
                      child: Text("아이디 찾기", style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        // 아이디찾기
                        // authService.signUp(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        //   onSuccess: () {
                        //     // 아이디 찾기 성공
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text("아이디 찾기 성공"),
                        //     ));
                        //   },
                        //   onError: (err) {
                        //     // 에러 발생
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(err),
                        //     ));
                        //   },
                        // );
                      },
                    ),
                    TextButton(
                      child: Text("비밀번호 찾기", style: TextStyle(fontSize: 15)),
                      onPressed: () {
                        // 비밀번호 찾기
                        // authService.signUp(
                        //   email: emailController.text,
                        //   password: passwordController.text,
                        //   onSuccess: () {
                        //     // 비밀번호 찾기 성공
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text("비밀번호 찾기 성공"),
                        //     ));
                        //   },
                        //   onError: (err) {
                        //     // 에러 발생
                        //     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        //       content: Text(err),
                        //     ));
                        //   },
                        // );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Text("Google로 로그인",
                        style: TextStyle(fontSize: 21, color: Colors.white)),
                    onPressed: () {
                      // 로그인
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          // 로그인 성공
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("로그인 성공"),
                          ));

                          // HomePage로 이동
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        onError: (err) {
                          // 에러 발생
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: Text("Naver로 로그인",
                        style: TextStyle(fontSize: 21, color: Colors.white)),
                    onPressed: () {
                      // 로그인
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          // 로그인 성공
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("로그인 성공"),
                          ));

                          // HomePage로 이동
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        onError: (err) {
                          // 에러 발생
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(err),
                          ));
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
        // );
      },
    );
  }
}

// /// 홈페이지
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   TextEditingController jobController = TextEditingController();
//   List<String> bucketList = []; // 버킷 리스트 데이터를 저장할 리스트

//   @override
//   void initState() {
//     super.initState();
//     _fetchBucketList(); // 버킷 리스트 데이터를 서버에서 가져옴
//   }

//   Future<void> _fetchBucketList() async {
//     final authService = context.read<AuthService>();
//     try {
//       final response = await http.get(
//         Uri.parse('https://your-spring-server.com/api/bucket'),
//         headers: {
//           'Authorization': 'Bearer ${authService.token}',
//         },
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           bucketList = List<String>.from(json.decode(response.body));
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("버킷 리스트를 가져오는데 실패했습니다."),
//         ));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("에러가 발생했습니다: $e"),
//       ));
//     }
//   }

//   Future<void> _addBucketItem(String job) async {
//     final authService = context.read<AuthService>();
//     try {
//       final response = await http.post(
//         Uri.parse('https://your-spring-server.com/api/bucket'),
//         headers: {
//           'Authorization': 'Bearer ${authService.token}',
//           'Content-Type': 'application/json',
//         },
//         body: json.encode({'job': job}),
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           bucketList.add(job);
//           jobController.clear();
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("버킷 리스트 추가에 실패했습니다."),
//         ));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("에러가 발생했습니다: $e"),
//       ));
//     }
//   }

//   Future<void> _deleteBucketItem(int index) async {
//     final authService = context.read<AuthService>();
//     try {
//       final response = await http.delete(
//         Uri.parse('https://your-spring-server.com/api/bucket/$index'),
//         headers: {
//           'Authorization': 'Bearer ${authService.token}',
//         },
//       );

//       if (response.statusCode == 200) {
//         setState(() {
//           bucketList.removeAt(index);
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//           content: Text("버킷 리스트 삭제에 실패했습니다."),
//         ));
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//         content: Text("에러가 발생했습니다: $e"),
//       ));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("버킷 리스트"),
//         actions: [
//           TextButton(
//             child: Text("로그아웃"),
//             onPressed: () {
//               // 로그아웃
//               context.read<AuthService>().signOut();

//               // 로그인 페이지로 이동
//               Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           /// 입력창
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Row(
//               children: [
//                 /// 텍스트 입력창
//                 Expanded(
//                   child: TextField(
//                     controller: jobController,
//                     decoration: InputDecoration(
//                       hintText: "하고 싶은 일을 입력해주세요.",
//                     ),
//                   ),
//                 ),

//                 /// 추가 버튼
//                 ElevatedButton(
//                   child: Icon(Icons.add),
//                   onPressed: () {
//                     // 버킷 아이템 추가
//                     if (jobController.text.isNotEmpty) {
//                       _addBucketItem(jobController.text);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Divider(height: 1),

//           /// 버킷 리스트
//           Expanded(
//             child: ListView.builder(
//               itemCount: bucketList.length,
//               itemBuilder: (context, index) {
//                 String job = bucketList[index];
//                 return ListTile(
//                   title: Text(
//                     job,
//                     style: TextStyle(
//                       fontSize: 24,
//                       color: Colors.black,
//                     ),
//                   ),
//                   // 삭제 아이콘 버튼
//                   trailing: IconButton(
//                     icon: Icon(CupertinoIcons.delete),
//                     onPressed: () {
//                       _deleteBucketItem(index); // 삭제 버튼 클릭 시 아이템 삭제
//                     },
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
