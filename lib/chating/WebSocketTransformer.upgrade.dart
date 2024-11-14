import 'dart:io';

Future<WebSocket> upgrade(
  HttpRequest request, {
  //Websocket으로 업그레이드할 HTTP 요청
  dynamic protocolSelector(List<String> protocols)?, //서버와 클라이언트 간 통신 서브 프로토콜 선택
  CompressionOptions compression =
      CompressionOptions.compressionDefault, //웹 소켓 압축 옵션
}) async {
  try {
    // Upgrade the request to a WebSocket connection using the WebSocketTransformer
    var webSocket = await WebSocketTransformer.upgrade(
      request,
      protocolSelector: protocolSelector,
      compression: compression,
    );
    return webSocket; // Return the WebSocket if upgrade is successful
  } catch (e) {
    // Handle the error and throw an exception if something goes wrong
    throw Exception('Failed to upgrade to WebSocket: $e');
  }
}
