import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:home_safe_apps/BaseAppBar.dart';
import 'geocoding.dart';
import 'data.dart';
import 'details_page.dart';

class OfficeMapScreen extends StatefulWidget {
  @override
  _OfficeMapScreenState createState() => _OfficeMapScreenState();
}

class _OfficeMapScreenState extends State<OfficeMapScreen> {
  late NaverMapController _mapController; // NaverMapController 생성
  final List<NMarker> _markers = [];

  @override
  void initState() {
    super.initState();
    _loadMarkers();
  }

  Future<void> _loadMarkers() async {
    // 예시 데이터
    List<dynamic> charterData = List<dynamic>.from(await fetchOfficeData());

    for (var data in charterData) {
      String address =
          formatAddress(data['sggNm'], data['umdNm'], data['jibun']);
      NLatLng? latLng = await fetchLatLngFromAddress(address); // 주소를 위도, 경도로 변환
      if (latLng != null) {
        final marker =
            NMarker(id: 'office_${data['offiNm']}', position: latLng);
        marker.setOnTapListener((NMarker marker) {
          _onMarkerTap(data);
        });
        setState(() {
          _markers.add(marker);
        });
      }
    }

    if (_mapController != null) {
      // _markers 리스트를 Set<NAddableOverlay>로 변환
      Set<NAddableOverlay> markerSet = _markers.toSet();
      _mapController.addOverlayAll(markerSet); // 전체 마커 리스트를 한 번에 추가
    } else {
      print('marker null');
    }
  }

  void _onMarkerTap(dynamic data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
          //productNo: data['productno'],
          offiNm: data['offiNm'],
          // ImageUrl: data['imageUrl'] ?? '',
          deposit: data['deposit'],
          //courthouse: data['courthouse'],
          address: data['address'],
          sggCd: data['sggCd'],
          sggNm: data['sggNm'],
          umdNm: data['umdNm'],
          jibun: data['jibun'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오피스텔 지도'),
        backgroundColor: Colors.green[700],
      ),
      body: Builder(
        builder: (BuildContext context) {
          return NaverMap(
            onMapReady: (NaverMapController controller) {
              _mapController = controller;
              _loadMarkers(); // 맵이 준비되었을 때 마커 로드
            },
          );
        },
      ),
      bottomNavigationBar: const BottomAppBarWidget(),
    );
  }
}

String formatAddress(String sggNm, String umdNm, String jibun) {
  return '$sggNm $umdNm $jibun';
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: '5qg6epilfh');
  runApp(MaterialApp(
    home: OfficeMapScreen(),
  ));
}
