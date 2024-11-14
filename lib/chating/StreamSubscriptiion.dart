import 'dart:async';

StreamSubscription<List<int>> listen(
  void Function(List<int> event)? onData, {
  //데이터가 이벤트 발생할 때 호출되는 콜백 함수
  Function? onError, //에러 이벤트가 발생할 때 호출되는 콜백 함수(생략 가능)
  void Function()? onDone, //완료 이벤트가 발생할 때 호출되는 콜백 함수(생략 가능)
  bool? cancelOnError, //에러 발생시 자동 종료 여부(기본값 false)
}) {
  try {
    // Assuming you're listening to a stream (you should have a Stream<List<int>>)
    Stream<List<int>> stream =
        Stream<List<int>>.empty(); // Placeholder for your actual stream

    // Return the stream's subscription
    return stream.listen(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  } catch (e) {
    // Handle error and throw an exception
    throw Exception('Failed to listen to stream: $e');
  }
}
