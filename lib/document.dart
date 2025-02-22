import 'package:flutter/material.dart';
import 'package:home_safe_apps/BaseAppBar.dart';
import 'package:home_safe_apps/Home%20Column.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  late List<bool> _isChecked;

  final List<String> _texts = [
    "지방세 및 국세 완납 증명서",
    "금융거래 내역 확인서",
    "등기부 등본",
    "임대차 계약서",
    "확정일자와 전입신고",
    "보험 가입",
    "임대인의 신용 정보 및 소득 증명서",
    "부동산의 실거래가 조회",
    "인근 시세 비교"
  ];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_texts.length, false);
  }

  void _checkAll() {
    setState(() {
      _isChecked = List<bool>.filled(_texts.length, true);
    });
  }

  void _uncheckAll() {
    setState(() {
      _isChecked = List<bool>.filled(_texts.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    const String username = "사용자";
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        // 테마 설정
        primaryColor: Colors.green[700],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false, // 디버그 배너 없애기
      home: Scaffold(
        appBar: AppBar(
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
          backgroundColor: Colors.green[700],
          title: const Text(
            '서류 체크',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Test",
              fontSize: 27,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      onPressed: _checkAll,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        side: const BorderSide(
                          color: Color.fromARGB(255, 178, 149, 192),
                          width: 4.0,
                        ),
                        minimumSize: const Size(50, 50),
                      ),
                      child: const Text(
                        '모두 선택',
                        style:
                            const TextStyle(fontFamily: "text3", fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: OutlinedButton(
                        onPressed: _uncheckAll,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 178, 149, 192),
                            width: 4.0,
                          ),
                          minimumSize: const Size(50, 50),
                        ),
                        child: const Text(
                          '모두 해제',
                          style: const TextStyle(
                              fontFamily: "text3", fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _texts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: CheckboxListTile(
                        title: Text(
                          _texts[index],
                          style: const TextStyle(
                            fontFamily: "Test",
                            fontSize: 25,
                          ),
                        ),
                        value: _isChecked[index],
                        onChanged: (val) {
                          setState(() {
                            _isChecked[index] = val ?? false;
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const BottomAppBarWidget(),
      ),
    );
  }
}
