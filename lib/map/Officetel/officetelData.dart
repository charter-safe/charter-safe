import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<dynamic>> fetchOfficeData() async {
  try {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/officetel'));

    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder();
      final jsonData =
          json.decode(utf8decoder.convert(response.bodyBytes)); // JSON 데이터를 디코딩
      if (jsonData == null) {
        throw Exception('응답 데이터가 없습니다.');
      }
      if (jsonData is Map && jsonData.containsKey('data')) {
        return jsonData['data']; // Map일 경우 'data' 필드 반환
      } else {
        throw Exception('Unexpected response format');
      }
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error in fetchOfficeData: $e');
    throw Exception('데이터를 불러오지 못했습니다?.');
  }
}
