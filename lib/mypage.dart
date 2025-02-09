import 'dart:io';
import 'package:flutter/material.dart';
import 'package:home_safe_apps/BaseAppBar.dart';
import 'package:home_safe_apps/Home%20Column.dart';
import 'package:image_picker/image_picker.dart';

class MyPageScreen extends StatefulWidget {
  @override
  _MyPageScreenState createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  File? _profileImage;
  String _username = "test";
  String _email = "test@test.com";

  // 프로필 변경 (갤러리에서 선택)
  Future<void> _changeProfileImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  // 정보 수정 다이얼로그
  void _editUserInfo() {
    TextEditingController nameController =
        TextEditingController(text: _username);
    TextEditingController emailController = TextEditingController(text: _email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "정보 수정",
            style: TextStyle(fontFamily: 'Test', fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: "이름")),
              TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "이메일")),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _username = nameController.text;
                  _email = emailController.text;
                });
                Navigator.pop(context);
              },
              child: Text("저장"),
            ),
          ],
        );
      },
    );
  }

  // 비밀번호 변경 다이얼로그
  void _changePassword() {
    TextEditingController currentPassController = TextEditingController();
    TextEditingController newPassController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("비밀번호 변경",
              style: TextStyle(fontFamily: 'Test', fontSize: 20)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: currentPassController,
                decoration: InputDecoration(labelText: "현재 비밀번호"),
                obscureText: true,
              ),
              TextField(
                controller: newPassController,
                decoration: InputDecoration(labelText: "새 비밀번호"),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                // 비밀번호 변경 로직 추가 가능
                Navigator.pop(context);
              },
              child: Text("변경"),
            ),
          ],
        );
      },
    );
  }

  // 로그아웃 확인 다이얼로그
  void _logout() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("로그아웃"),
          content: Text("정말 로그아웃 하시겠습니까?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () {
                // 로그아웃 처리 (예: 로그인 화면으로 이동)
                Navigator.pop(context);
              },
              child: Text("로그아웃"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String username = "사용자";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          iconSize: 35,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => HomeColumn(username: username),
              ),
            );
          },
        ),
        title: Text('마이페이지',
            style: TextStyle(
                color: Colors.white, fontFamily: "Test", fontSize: 27)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                GestureDetector(
                  onTap: _changeProfileImage,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: _profileImage != null
                        ? FileImage(_profileImage!)
                        : AssetImage('assets/default_profile.png')
                            as ImageProvider,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _changeProfileImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[700],
                  ),
                  child: Text('프로필 변경',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Test",
                          fontSize: 18)),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.person, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(_username, style: TextStyle(fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Icon(Icons.email, color: Colors.grey),
                    SizedBox(width: 10),
                    Text(_email, style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _editUserInfo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
                child: Text('정보 수정',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Test", fontSize: 18)),
              ),
              ElevatedButton(
                onPressed: _changePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[700],
                ),
                child: Text('비밀번호 수정',
                    style: TextStyle(
                        color: Colors.white, fontFamily: "Test", fontSize: 18)),
              ),
            ],
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: _logout,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('로그아웃',
                style: TextStyle(
                    color: Colors.white, fontFamily: "Test", fontSize: 18)),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}
