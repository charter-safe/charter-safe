import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'data.dart';

//주소, 가격, 법원, 담당자, 주인
class DetailsPage extends StatefulWidget {
  //int productNo;

  String offiNm;

  Int? deposit;

  String? sggNm;

  String? umdNm;

  String? jibun;

  String? sggCd;

  //String courthouse;

  String? address;

  DetailsPage(
      {super.key,
      //required this.productNo,
      //required this.ImageUrl,
      required this.offiNm,
      required this.deposit,
      required this.address,
      //required this.courthouse,
      required this.sggNm,
      required this.jibun,
      required this.sggCd,
      required this.umdNm});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final numberFormat = NumberFormat.currency(locale: 'ko_KR', symbol: '₩');
  Map<String, dynamic>? additionalData;

  @override
  void initState() {
    super.initState();
    fetchAdditionalData(); // 페이지 로드 시 데이터 불러오기
  }

  Future<void> fetchAdditionalData() async {
    final url = Uri.parse(
        'http://ec2-43-202-40-43.ap-northeast-2.compute.amazonaws.com:8080/charter');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        additionalData = jsonDecode(response.body); // 응답 데이터 저장
      });
    } else {
      print('Failed to load additional data');
    }
  }

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
            // Container(
            //   alignment: Alignment.center,
            //   padding: const EdgeInsets.all(15),
            //   // child: CachedNetworkImage(
            //   //   width: MediaQuery.of(context).size.width * 0.8,
            //   //   fit: BoxFit.cover,
            //   //   imageUrl: widget.ImageUrl,
            //   //   placeholder: (context, url) {
            //   //     return const Center(
            //   //       child: CircularProgressIndicator(
            //   //         strokeWidth: 2,
            //   //       ),
            //   //     );
            //   //   },
            //   //   errorWidget: (context, url, error) {
            //   //     return const Center(
            //   //       child: Text("오류 발생"),
            //   //     );
            //   //   },
            //   // ),
            // ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.offiNm,
                textScaleFactor: 1.5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "${numberFormat.format(widget.deposit)}원",
                textScaleFactor: 1.3,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: FilledButton(
          onPressed: () {},
          child: const Text("리뷰/평가"),
        ),
      ),
    );
  }
}
