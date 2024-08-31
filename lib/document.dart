import 'package:flutter/material.dart';

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
          icon: Icon(Icons.menu),
          iconSize: 35,
          onPressed: () {
            print('menu B');
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 10),
            child: Text(
              "서류 체크 리스트",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            // Wrap ListView.builder with Expanded
            child: ListView.builder(
              itemCount: _texts.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: CheckboxListTile(
                      title: Text(_texts[index]),
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
    );
  }
}
