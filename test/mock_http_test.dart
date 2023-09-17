import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';
import 'package:http_client_demo/http_clients/guest_http_client.dart';
import 'package:http_client_demo/api_services/login_service.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main(){
  test("get the local json", () async {
    final mockClient = MockClient((request) async {
      if (request.url.path != 'example.com/login') {
        return Response("", 404);
      }
      return Response(
          json.encode({
            'numbers': [1, 4, 15, 19, 214]
          }),
          200,
          headers: {'content-type': 'application/json'});
    });

    GuestClient guestClient = GuestClient(httpClient: mockClient);
    LoginService loginService = LoginService(httpClient: guestClient);
    Response response = await loginService.login("kk", "123");
    expect(response.body, '{"numbers":[1,4,15,19,214]}');
  });
}
