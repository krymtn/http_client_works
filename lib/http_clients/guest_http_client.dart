import 'dart:convert';

import 'package:http/http.dart' as http;

class GuestClient extends http.BaseClient {
  final http.Client httpClient;
  GuestClient({required this.httpClient});

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    var defaultHeaders = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    request.headers.addAll(defaultHeaders);
    return httpClient.send(request);
  }

  @override
  Future<http.Response> post(url, {Map<String, String>? headers, dynamic body, Encoding? encoding}) {
    return httpClient.post(url, headers: headers, body: body, encoding: encoding);
  }
}