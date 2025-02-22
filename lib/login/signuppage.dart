import 'service.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '회원가입',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const RegisterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // TextEditingController 선언
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordCheckController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  // FocusNode 선언
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode passwordCheckFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();
  FocusNode yearFocusNode = FocusNode();
  FocusNode birthdayFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();
  FocusNode addressFocusNode = FocusNode();

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입', style: TextStyle(fontSize: 22)),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        elevation: 3,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10),
              Text(
                "회원 정보를 입력하세요",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800]),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      _buildTextField(
                          emailController, "이메일", Icons.email, emailFocusNode,
                          nextFocusNode: passwordFocusNode),
                      _buildTextField(passwordController, "비밀번호", Icons.lock,
                          passwordFocusNode,
                          obscureText: true,
                          nextFocusNode: passwordCheckFocusNode),
                      _buildTextField(passwordCheckController, "비밀번호 확인",
                          Icons.lock, passwordCheckFocusNode,
                          obscureText: true, nextFocusNode: nameFocusNode),
                      _buildTextField(
                          nameController, "이름", Icons.person, nameFocusNode,
                          nextFocusNode: yearFocusNode),
                      _buildTextField(yearController, "생년",
                          Icons.calendar_today, yearFocusNode,
                          nextFocusNode: birthdayFocusNode),
                      _buildTextField(birthdayController, "월일", Icons.cake,
                          birthdayFocusNode,
                          nextFocusNode: phoneNumberFocusNode),
                      _buildTextField(phoneNumberController, "전화번호",
                          Icons.phone, phoneNumberFocusNode,
                          nextFocusNode: addressFocusNode),
                      _buildTextField(
                          addressController, "주소", Icons.home, addressFocusNode,
                          action: TextInputAction.done),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                  minimumSize: const Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  '가입 완료',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                onPressed: () {
                  service.saveUser(
                    emailController.text,
                    passwordController.text,
                    passwordCheckController.text,
                    nameController.text,
                    phoneNumberController.text,
                    addressController.text,
                    yearController.text,
                    birthdayController.text,
                  );
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TextField 위젯 생성
  Widget _buildTextField(
    TextEditingController controller,
    String hint,
    IconData icon,
    FocusNode currentFocusNode, {
    bool obscureText = false,
    TextInputAction action = TextInputAction.next,
    FocusNode? nextFocusNode,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        textInputAction: action,
        focusNode: currentFocusNode,
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: Colors.green),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green, width: 2),
          ),
        ),
        onSubmitted: (value) {
          if (nextFocusNode != null) {
            FocusScope.of(context).requestFocus(nextFocusNode); // 다음 필드로 포커스 이동
          }
        },
      ),
    );
  }
}
