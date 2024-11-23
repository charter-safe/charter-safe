import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'Apt/AptMap.dart';
import 'Officetel/officetelMap.dart';

class OfficeAndAptMapScreen extends StatefulWidget {
  const OfficeAndAptMapScreen({super.key});

  @override
  _OfficeAndAptMapScreenState createState() => _OfficeAndAptMapScreenState();
}

class _OfficeAndAptMapScreenState extends State<OfficeAndAptMapScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('지도'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: '오피스텔'),
            Tab(text: '아파트'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OfficeMapScreen(), // 오피스텔 지도 화면
          AptMapScreen(), // 아파트 지도 화면
        ],
      ),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: '074svwu57e');
  runApp(MaterialApp(home: OfficeAndAptMapScreen()));
}
