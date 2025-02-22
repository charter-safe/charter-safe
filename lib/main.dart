import 'package:flutter/material.dart';
import 'package:home_safe_apps/Home%20Column.dart';
import 'package:home_safe_apps/login/signuppage.dart';
import 'package:provider/provider.dart';
import 'package:home_safe_apps/login/auth_service.dart';
import 'package:home_safe_apps/mypage.dart'; // 마이페이지 파일 가져오기

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
                            MaterialPageRoute(
                                builder: (context) => HomeColumn(
                                      username: "a",
                                    )),
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
