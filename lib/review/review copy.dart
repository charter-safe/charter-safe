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
        primarySwatch: Colors.teal,
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
  final Review review2 = Review(
    nickname: 'person2',
    content: '넘 좋아요렁니러아ㅓ라이ㅓㅣㅇ러ㅏ힝라ㅓㅎㄹㄹ이허ㅏㅇ리ㅓㅏ힝러ㅣㅇ러ㅏ리어히ㅓ할어ㅏㅎ어히러아ㅣㅓ하이이',
    rating: 4,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리뷰/평가'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          iconSize: 35,
          onPressed: () {
            Navigator.pop(context);
            // MaterialPageRoute(
            //   builder: (context) => MyApp(),
          },
        ),
      ),
    body:
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            color: Color.fromARGB(255, 255, 255, 255),
            height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.teal,
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
                SizedBox(height: 8.0),
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
