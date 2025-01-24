// import 'package:bucket_list_with_firebase/Home.dart';
import 'package:flutter/material.dart';
import 'package:home_safe_apps/BaseAppBar.dart';
import 'package:home_safe_apps/Home%20Column.dart';
import 'package:home_safe_apps/Home.dart';
import 'package:home_safe_apps/map/map.dart';

class Documentpage extends StatefulWidget {
  const Documentpage({Key? key}) : super(key: key);

  @override
  _Document createState() => _Document();
}

class _Document extends State<Documentpage> {
  List<bool>? _isChecked;

  List<String> _texts = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          iconSize: 35,
          color: Colors.white,
          onPressed: () {
            Navigator.pop(
              context,
              MaterialPageRoute(
                builder: (context) => HomeColumn(),
              ),
            );
          },
        ),
        backgroundColor: Colors.green[700],
        title: Text('서류 체크',
            style: TextStyle(
                color: Colors.white, fontFamily: "Test", fontSize: 27)),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _texts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: CheckboxListTile(
                      title: Text(_texts[index],
                          style: TextStyle(fontFamily: "Test", fontSize: 25)),
                      value: _isChecked![index],
                      onChanged: (val) {
                        setState(
                          () {
                            _isChecked![index] = val!;
                            print(index);
                          },
                        );
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
    );
  }
}
