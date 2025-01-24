import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:home_safe_apps/BaseAppBar.dart';
// import 'package:home_safe_apps/BottomAppBarWidget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Flutter App', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;

  // late 키워드 추가 (Flutter 최신 버전 호환)
  late final CarouselSliderController _controller = CarouselSliderController();

  final List<String> imageList = [
    "assets/svg/1.png",
    "assets/svg/2.png",
    "assets/svg/3.png",
    "assets/svg/4.png",
    "assets/svg/5.png",
    "assets/svg/6.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Baseappbar(),
      body: Column(
        children: [
          SizedBox(
            height: 300,
            child: Stack(
              children: [
                sliderWidget(),
                sliderIndicator(),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Text(
              "계약을 할 땐 신중하게,",
              style: TextStyle(fontFamily: 'Test', fontSize: 30),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: const Text(
              "그리고 많이 찾아보는 것이 중요합니다.",
              style: TextStyle(fontFamily: 'Test', fontSize: 30),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomAppBarWidget(), // 여기서 적용
    );
  }

  Widget sliderWidget() {
    return CarouselSlider(
      carouselController: _controller,
      items: imageList.map((imgLink) {
        return Builder(
          builder: (context) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                imgLink,
                fit: BoxFit.contain,
              ),
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        height: 300,
        viewportFraction: 1.0,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4),
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        },
      ),
    );
  }

  Widget sliderIndicator() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => _controller.animateToPage(entry.key),
            child: Container(
              width: 12,
              height: 12,
              margin:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:
                    Colors.white.withOpacity(_current == entry.key ? 0.9 : 0.4),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
