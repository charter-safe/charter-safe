import 'package:flutter/material.dart';

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
        primarySwatch: Colors.grey,
      ),
      home: ReviewDetailPage(),
    );
  }
}

class ReviewDetailPage extends StatelessWidget {
  // 예시 리뷰 데이터
  final Review review = Review(
    nickname: 'person1',
    content: '이 분은 조금 아닌듯',
    rating: 1,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰/평가'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(width: 8.0),
                Text(
                  'Author: ${review.nickname}',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(Icons.star),
                SizedBox(width: 8.0),
                Text(
                  'Rating: ${review.rating} / 5',
                  style: TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            SizedBox(height: 16.0),
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
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
