import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final String ImageUrl;
  final String offiNm;
  final int deposit;
  final String address;
  final double rate;
  final int tax;
  final int risk;

  DetailsPage({
    Key? key,
    required this.ImageUrl,
    required this.offiNm,
    required this.deposit,
    required this.address,
    required this.rate,
    required this.tax,
    required this.risk,
  }) : super(key: key);

  final numberFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 252, 218),
      appBar: AppBar(
        title: const Text("상세 페이지"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                ImageUrl,
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
                errorBuilder: (context, url, error) => const Center(
                  child: Text("이미지를 로드할 수 없습니다."),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text('건물명 : '),
                  Text(
                    offiNm,
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text('주소 : '),
                  Text(
                    address,
                    textScaleFactor: 1.5,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                children: [
                  Text('금액 : '),
                  Text(
                    "${numberFormat.format(deposit)}만원",
                    textScaleFactor: 1.3,
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "전세가율: ${rate.toStringAsFixed(2)}%",
                textScaleFactor: 1.3,
              ),
            ),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Text(
            //     "세금 미납액: ${numberFormat.format(tax)}원",
            //     textScaleFactor: 1.3,
            //   ),
            // ),
            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 20),
            //   child: Text(
            //     "위험도: $risk",
            //     textScaleFactor: 1.3,
            //   ),
            // ),
            // bottomNavigationBar: Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     child: const Text("리뷰/평가"),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: ElevatedButton.icon(
                label: const Text('리뷰/평가',
                    style: TextStyle(fontFamily: 'text', fontSize: 20)),
                icon: const Icon(Icons.rate_review,
                    size: 40, color: Colors.black),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shadowColor: const Color.fromARGB(255, 174, 202, 188),
                  elevation: 10.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  side: const BorderSide(
                      color: Color.fromARGB(255, 28, 100, 38), width: 4.0),
                  minimumSize: const Size(500, 50),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
