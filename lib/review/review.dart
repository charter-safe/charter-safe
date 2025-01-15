import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 리뷰 모델 정의
class Review {
  final String nickname;
  final String content;
  final int rating;

  Review({
    required this.nickname,
    required this.content,
    required this.rating,
  });

  // JSON 데이터를 Review 객체로 변환
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      nickname: json['nickname'],
      content: json['content'],
      rating: json['rating'],
    );
  }
}

void main() {
  runApp(ReviewApp());
}

class ReviewApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '리뷰/평가',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ReviewListPage(),
    );
  }
}

class ReviewListPage extends StatefulWidget {
  @override
  _ReviewListPageState createState() => _ReviewListPageState();
}

class _ReviewListPageState extends State<ReviewListPage> {
  late Future<List<Review>> _reviews;

  @override
  void initState() {
    super.initState();
    _reviews = fetchReviews(); // 초기화 시 데이터 가져오기
  }

  Future<List<Review>> fetchReviews() async {
    final response = await http.get(Uri.parse('https://example.com/reviews'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Review.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load reviews');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰/평가'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Review>>(
        future: _reviews,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('데이터를 불러오지 못했습니다.'));
          } else {
            final reviews = snapshot.data!;
            return ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return ReviewCard(review: review);
              },
            );
          }
        },
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final Review review;

  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 157, 252, 243),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text(
                  review.nickname,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    '평점:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  _buildStarRating(review.rating),
                ],
              ),
              Divider(thickness: 1.0, color: Colors.grey[300]),
              SizedBox(height: 8.0),
              Text(
                '리뷰:',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                review.content,
                style: TextStyle(fontSize: 16.0, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRating(int rating) {
    List<Widget> stars = [];
    for (int i = 1; i <= 5; i++) {
      stars.add(
        Icon(
          i <= rating ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 24.0,
        ),
      );
    }
    return Row(children: stars);
  }
}
