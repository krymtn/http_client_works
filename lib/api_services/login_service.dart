import 'package:http_client_demo/http_clients/guest_http_client.dart';
import 'package:http/http.dart' as http;

abstract class ILoginService {
  void login(String email, String password);
}

class LoginService extends GuestClient implements ILoginService {
  LoginService({required super.httpClient});

  @override
  dynamic login(String email, String password) async {
    var response = post(Uri.parse('example.com/login'), body: {"email":"koray", "pass":"pass"});
    return response;
  }
}