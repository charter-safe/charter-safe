import 'package:flutter/material.dart';
import 'package:home_safe_apps/Home%20Column.dart';
import 'package:home_safe_apps/login/find_id.dart';
import 'package:home_safe_apps/login/find_pw.dart';
import 'package:home_safe_apps/login/member.dart';
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

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthService>(
      builder: (context, authService, child) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 25),
                  child: Container(
                    child: Image.asset('assets/logo(5).png',
                        fit: BoxFit.fitHeight),
                    width: 100,
                    height: 250,
                  ),
                ),

                // 이메일 텍스트 필드
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: '이메일',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),

                // 비밀번호 텍스트 필드
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: '비밀번호',
                      labelStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                      ),
                    ),
                  ),
                ),

                // 로그인 버튼
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 12, 59, 14), // 초록색 버튼
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("로그인",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () {
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("로그인 성공")),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomeColumn(username: "a")),
                          );
                        },
                        onError: (err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(err)),
                          );
                        },
                      );
                    },
                  ),
                ),

                // 회원가입 버튼
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text("회원가입",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text("아이디 찾기",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FindIdPage()),
                          );
                        },
                      ),
                      TextButton(
                        child: Text("비밀번호 찾기",
                            style:
                                TextStyle(fontSize: 15, color: Colors.black)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FindPasswordPage()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Google 로그인 버튼
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color.fromARGB(255, 14, 40, 96), // 구글 로그인 버튼 색
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Google로 로그인",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () {
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("로그인 성공")),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        onError: (err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(err)),
                          );
                        },
                      );
                    },
                  ),
                ),

                // Naver 로그인 버튼
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // 네이버 로그인 버튼 색
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text("Naver로 로그인",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    onPressed: () {
                      authService.signIn(
                        email: emailController.text,
                        password: passwordController.text,
                        onSuccess: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("로그인 성공")),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => MyApp()),
                          );
                        },
                        onError: (err) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(err)),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
