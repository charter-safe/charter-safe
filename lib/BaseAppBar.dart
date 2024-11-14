import 'package:flutter/material.dart';
import 'package:home_safe_apps/Home.dart';
import 'package:home_safe_apps/document.dart';
import 'package:home_safe_apps/map/map.dart';

class Baseappbar extends StatelessWidget implements PreferredSizeWidget {
  const Baseappbar({super.key});

  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              FittedBox(
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Text(
                    "안심하는 전세사기",
                    style: TextStyle(fontSize: 15),
                  ),
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
          backgroundColor: Colors.green[700],
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
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
            icon: const Icon(Icons.navigate_before),
            iconSize: 35,
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          backgroundColor: Colors.green[700],
        ),
      ),
    );
  }
}

class BottomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const BottomAppBarWidget({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green[700],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.home_filled, size: 40),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.map, size: 40),
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
            icon: const Icon(Icons.document_scanner, size: 40),
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
            icon: const Icon(Icons.person, size: 40),
            onPressed: () {
              // Add the action for this button, or leave it as an empty function
            },
          ),
        ],
      ),
    );
  }
}
