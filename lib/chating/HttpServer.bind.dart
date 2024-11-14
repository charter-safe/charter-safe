//bind static method
import 'dart:io';

Future<HttpServer> bind(
    dynamic address, //서버를 바인딩할 주소(IP 주소, 호스트 이름)
    int port, //서버를 바인딩할 포트 번호. 값이 0일 경우 시스템에서 임시 포트 사용
    {int backlog = 0, //소켓 대기열의 최대 길이. 기본값 0 => 대기 시간 X
    bool v60nly = false, //IPv6만 연결할 수 있도록 설정. 기본값 false
    bool shared = false} //포트가 다른 서비스와 공유될 수 있는지 여부 지정. 기본값 false
    ) async {
  try {
    // Use the HttpServer.bind method to bind to the address and port
    var server = await HttpServer.bind(
      address,
      port,
      backlog: backlog,
      v6Only: v60nly,
      shared: shared,
    );
    return server; // Return the bound server if successful
  } catch (e) {
    // If an error occurs, throw an exception
    throw Exception('Failed to bind the server: $e');
  }
}
