import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'http://10.0.2.2:8000/api/login';

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Accept': 'application/json'},
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return {'success': true, 'token': data['token'], 'user': data['user']};
    } else {
      final error = json.decode(response.body);
      return {'success': false, 'message': error['message'] ?? 'Login gagal'};
    }
  }
}
