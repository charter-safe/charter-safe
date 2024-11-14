// import 'package:bucket_list_with_firebase/auth_service.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController passwordCheckController = TextEditingController();
//   TextEditingController nameController = TextEditingController();
//   TextEditingController numberController = TextEditingController();
//   TextEditingController addressController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("회원가입")),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: '이메일',
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: passwordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '비밀번호',
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: passwordCheckController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '비밀번호 확인',
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '이름',
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: numberController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '전화번호',
//                   )),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: TextField(
//                   controller: addressController,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: '주소',
//                   )),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               child: Text("가입"),
//               onPressed: () {
//                 // 회원가입 로직 구현
//                 context.read<AuthService>().signUp(
//                       email: emailController.text,
//                       password: passwordController.text,
//                       passwordcheck: passwordCheckController.text,
//                       name: nameController.text,
//                       number: numberController.text,
//                       address: addressController.text,
//                       onSuccess: () {
//                         // 회원가입 성공 처리
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("회원가입 성공"),
//                         ));

//                         // 로그인 페이지로 이동
//                         Navigator.pop(context);
//                       },
//                       onError: (err) {
//                         // 회원가입 실패 처리
//                         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                           content: Text("회원가입 실패: $err"),
//                         ));
//                       },
//                     );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'service.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordcheckController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phonenumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  Service service = Service();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입 화면'),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Center(
            child: SizedBox(
              height: 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: "이메일"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: passwordController,
              decoration: InputDecoration(hintText: "비밀번호"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: passwordcheckController,
              decoration: InputDecoration(hintText: "비밀번호 중복확인"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: yearController,
              decoration: InputDecoration(hintText: "생년"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: birthdayController,
              decoration: InputDecoration(hintText: "월일"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(hintText: "이름"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: phonenumberController,
              decoration: InputDecoration(hintText: "전화번호"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 250,
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(hintText: "주소"),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          SizedBox(
            width: 250,
            child: ElevatedButton(
              child: const Text('전송'),
              onPressed: () {
                service.saveUser(
                    emailController.text,
                    passwordController.text,
                    passwordcheckController.text,
                    nameController.text,
                    phonenumberController.text,
                    addressController.text,
                    yearController.text,
                    birthdayController.text);
                Navigator.pop(context);
              },
            ),
          )
        ],
      )),
    );
  }
}
