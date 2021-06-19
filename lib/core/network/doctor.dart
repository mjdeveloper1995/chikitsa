import 'package:chikitsa/core/network/endpoint.dart';
import 'package:http/http.dart' as http;

class DoctorService {
  static Future<http.Response> updatePassword(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.updatePassword),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

  static Future<http.Response> editProfile(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.editProfile),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

  static Future<http.Response> patientList(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.patientList),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

  static Future<http.Response> changeDoctor(Map<String,dynamic> formData) async {
    final http.Response response = await http.post(
      Uri.parse(EndPoint.changeDoctor),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: formData,
    );
    return response;
  }

}
