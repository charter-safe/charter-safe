import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import '../geocoding.dart';
import 'officetelData.dart';
import 'officetel_details_page.dart';

class OfficeMapScreen extends StatefulWidget {
  const OfficeMapScreen({super.key});

  @override
  _OfficeMapScreenState createState() => _OfficeMapScreenState();
}

class _OfficeMapScreenState extends State<OfficeMapScreen>
    with AutomaticKeepAliveClientMixin {
  late NaverMapController _mapController; // NaverMapController 생성
  final List<NClusterableMarker> _markers = [];
  Map<String, bool> isOpenClose = {};

  @override
  bool get wantKeepAlive => true; // 상태 유지 설정

  Future<void> _loadMarkers() async {
    // 예시 데이터
    List<dynamic> charterData = List<dynamic>.from(await fetchOfficeData());

    for (var data in charterData) {
      NLatLng? latLng =
          await fetchLatLngFromAddress(data['address']); // 주소를 위도, 경도로 변환
      if (latLng != null) {
        final marker = NClusterableMarker(
            id: 'office_${data['offiNm']}', position: latLng);

        isOpenClose[data["offiNm"]] = false;

        marker.setOnTapListener((NMarker marker) {
          _showCustomInfoWindow(context, data);
        });

        setState(() {
          _markers.add(marker);
        });
      }
    }
    // _markers 리스트를 Set<NAddableOverlay>로 변환
    Set<NAddableOverlay> markerSet = _markers.toSet();
    _mapController.addOverlayAll(markerSet); // 전체 마커 리스트를 한 번에 추가
  }

  void _showCustomInfoWindow(BuildContext context, dynamic data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), // 모서리 둥글게
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.7, // 가로 크기만 조정
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // 세로 크기는 내용에 맞춤
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${data["offiNm"]}', // 텍스트 표시
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text('주소: ${data["address"]}'),
                Text('보증금: ${data["deposit"]}만원'),
                Text('월세: ${data["monthlyRent"]}만원'),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween, // 버튼 간격 자동 정렬
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        _onMarkerTap(data);
                      },
                      child: Text('자세히'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop(); // 다이얼로그 닫기
                      },
                      child: Text('닫기'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onMarkerTap(dynamic data) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsPage(
            offiNm: data['offiNm'],
            ImageUrl: 'assets/오피스텔.jpg',
            deposit: data['deposit'],
            address: data['address'],
            floor: data["floor"],
            buildYear: data["buildYear"],
            excluUseAr: data["excluUseAr"],
            contractTerm: data["contractTerm"],
            monthlyRent: data["monthlyRent"],
            rate: data['charter_rate'],
            tax: data['back_taxes'],
            risk: data['risk']),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (BuildContext context) {
          super.build(context);
          return NaverMap(
            onMapReady: (NaverMapController controller) {
              _mapController = controller;
              _loadMarkers(); // 맵이 준비되었을 때 마커 로드
            },
            clusterOptions: NaverMapClusteringOptions(
                clusterMarkerBuilder: (context, clusterMarkers) {
              //return NClusterMarker({id: 'd', position: latng});
            }),
          );
        },
      ),
    );
  }
}
