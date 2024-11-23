import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailsPage extends StatelessWidget {
  final String ImageUrl;
  final String offiNm;
  final int deposit;
  final String address;
  final String floor;
  final String buildYear;
  final String excluUseAr;
  final String contractTerm;
  final String monthlyRent;
  final double rate;
  final int tax;
  final int risk;

  DetailsPage({
    super.key,
    required this.ImageUrl,
    required this.offiNm,
    required this.deposit,
    required this.address,
    required this.floor,
    required this.buildYear,
    required this.excluUseAr,
    required this.contractTerm,
    required this.monthlyRent,
    required this.rate,
    required this.tax,
    required this.risk,
  });

  final numberFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("상세 페이지"),
        centerTitle: true,
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
              child: Text(
                offiNm,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                address,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                floor,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                buildYear,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                excluUseAr,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                contractTerm,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "월세 : monthlyRent",
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "전세 OR 보증금 :${numberFormat.format(deposit)}만원",
                textScaleFactor: 1.3,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "전세가율 : ${rate.toStringAsFixed(2)}%",
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
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {},
          child: const Text("리뷰/평가"),
        ),
      ),
    );
  }
}
