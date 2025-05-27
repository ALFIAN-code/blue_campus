import 'dart:convert';
import 'package:bluecampus_mobile/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {


  static Future<bool> login(String email, String password) async {
    final url = Uri.parse('$baseUrl/api/login');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', data['token']);
      await prefs.setString('user', json.encode(data['user']));

      return true;
    } else {
      print('Login failed: ${response.statusCode}');
      print('Response body: ${response.body}');
      return false;
    }
  }

  static Future<bool> logout() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    var success = false;

    if (token != null) {
      final url = Uri.parse('$baseUrl/logout');

      final response = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        },
      );

      if (response.statusCode != 200) {
        print('Logout failed: ${response.statusCode}');
        print('Response body: ${response.body}');
        success = false;
      } else {
        print('Logout successful');
        success = true;
      }
    }
    await prefs.clear();
    return success;
  }

  static Future<Map<String, dynamic>?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');

    if (userString == null) return null;
    return json.decode(userString);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<Map<String, dynamic>?> fetchProfile() async {
    final token = await getToken();
    final url = Uri.parse('$baseUrl/profile');

    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      print('Failed to fetch profile: ${response.statusCode}');
      print('Response body: ${response.body}');
      return null;
    }
  }
}
