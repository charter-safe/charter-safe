import 'package:flutter/material.dart';
import 'package:home_safe_apps/Home%20Column.dart';
import 'package:home_safe_apps/Home.dart';
import 'package:home_safe_apps/document.dart';
import 'package:home_safe_apps/map/Apt/AptMap.dart';
import 'package:home_safe_apps/map/Officetel/officetelMap.dart';
import 'package:home_safe_apps/map/map.dart';
import 'package:home_safe_apps/mypage.dart';

class Baseappbar extends StatelessWidget implements PreferredSizeWidget {
  const Baseappbar({super.key});

  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    String username = "사용자";
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/logo(2).png', height: 100, width: 120),
          centerTitle: true,
          backgroundColor: Colors.green[700],
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            iconSize: 35,
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeColumn(
                    username: username,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class Baseappbar2 extends StatelessWidget implements PreferredSizeWidget {
  const Baseappbar2({super.key});

  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    String username = "사용자";
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/logo(2).png', height: 50, width: 50),
          centerTitle: true,
          backgroundColor: Colors.green[700],
          leading: IconButton(
            icon: const Icon(Icons.navigate_before),
            iconSize: 35,
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeColumn(username: username),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.green[700],
      ),
    );
  }
}

class Baseappbar3 extends StatefulWidget implements PreferredSizeWidget {
  const Baseappbar3({super.key});

  @override
  Size get preferredSize =>
      const Size.fromHeight(80.0); // Increase height to accommodate TabBar

  @override
  _Baseappbar3State createState() => _Baseappbar3State();
}

class _Baseappbar3State extends State<Baseappbar3>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 2, vsync: this); // Two tabs (오피스텔, 아파트)
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
          title: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "지도",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(width: 30), // 지도와 검색창 사이의 간격
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: '검색어를 입력하세요',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      style: const TextStyle(fontSize: 15),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search), // Search icon
                    iconSize: 35,
                    onPressed: () {
                      // Trigger the search logic
                      String query =
                          "검색어"; // Replace with actual search controller logic
                      if (query.isNotEmpty) {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text("검색 결과"),
                            content: Text("검색어: $query"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.of(context).pop(),
                                child: const Text('닫기'),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.villa), text: '오피스텔'),
                  Tab(icon: Icon(Icons.apartment), text: '아파트'),
                ],
                indicatorColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Baseappbar4 extends StatefulWidget implements PreferredSizeWidget {
  // Implement PreferredSizeWidget here
  const Baseappbar4({super.key});

  @override
  _Baseappbar4State createState() => _Baseappbar4State();

  @override
  Size get preferredSize =>
      const Size.fromHeight(80.0); // Provide preferredSize here
}

class _Baseappbar4State extends State<Baseappbar4>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green[700],
      title: Row(
        children: [
          TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: '전세'),
              Tab(text: '월세'),
              Tab(text: "반전세"),
            ],
          ),
        ],
      ),
    );
  }
}

class BottomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const BottomAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    String username = "사용자";
    return BottomAppBar(
      color: Colors.green[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home_filled, size: 50),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeColumn(username: username),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.map, size: 50),
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
            icon: const Icon(Icons.document_scanner, size: 50),
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
            icon: const Icon(Icons.person, size: 50),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyPageScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
