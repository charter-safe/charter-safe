import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '리뷰 목록',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ReviewListPage(),
    );
  }
}

class Review {
  final String author;
  final String content;
  final double rating;

  Review({required this.author, required this.content, required this.rating});
}

class ReviewListPage extends StatelessWidget {
  const ReviewListPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시로 사용할 리뷰 데이터 목록
    final reviews = [
      Review(author: '홍길동', content: '조심하세요...', rating: 2.0),
      Review(author: '김영희', content: '생각보다 별로였어요.', rating: 1.0),
      Review(author: '이철수', content: '잘 모르겠어요', rating: 3.5),
      Review(
          author: '박민수', content: '친절하기는 한데 너무 재촉해서 부담스럽고 걱정돼요', rating: 0.5),
      Review(author: '장미', content: '가격대비 좋진 않아요', rating: 3.0),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 60),
              child: Text(
                "안심하는 전세사기",
                style: TextStyle(fontSize: 15),
              ),
            ),
            Text(
              "전Safe",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu),
          iconSize: 35,
          onPressed: () {
            print('menu B');
          },
        ),
        backgroundColor: Colors.grey,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '리뷰 / 평가',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      review.author,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 5),
                        Text(review.content),
                        const SizedBox(height: 10),
                        Row(
                          children: List.generate(5, (i) {
                            return Icon(
                              i < review.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                    isThreeLine: true,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
