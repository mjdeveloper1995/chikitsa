import 'package:chikitsa/core/network/endpoint.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static Future<http.Response> registration(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.registration),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

  static Future<http.Response> getUserByID(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.getUser),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

  static Future<http.Response> login(Map<String,dynamic> formData,bool isPhone) async {
    final http.Response response = await http.post(
      Uri.parse(isPhone ? EndPoint.login : EndPoint.loginEmail),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

  static Future<http.Response> forgotPassword(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.forgotPassword),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

}
