import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_naver_map/flutter_naver_map.dart';

Future<NLatLng?> fetchLatLngFromAddress(String address) async {
  final String clientId = '5qg6epilfh';
  final String clientSecret = 'PUOtrD09dhr5EMNhmVE7j8Dw7NPsSUwWu8qb1t8Z';

  final response = await http.get(
    Uri.parse(
        'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=$address'),
    headers: {
      'X-NCP-APIGW-API-KEY-ID': '5qg6epilfh',
      'X-NCP-APIGW-API-KEY': 'PUOtrD09dhr5EMNhmVE7j8Dw7NPsSUwWu8qb1t8Z',
    },
  );

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['addresses'].isNotEmpty) {
      final lat = double.parse(data['addresses'][0]['y']);
      final lng = double.parse(data['addresses'][0]['x']);
      return NLatLng(lat, lng);
    } else {
      print('주소를 찾을 수 없습니다.');
      return null;
    }
  } else {
    print('지오코딩 API 호출 실패');
    return null;
  }
}
