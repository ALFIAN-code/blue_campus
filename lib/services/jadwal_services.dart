import 'dart:convert';

import 'package:bluecampus_mobile/Models/jadwal/jadwal_model.dart';
import 'package:bluecampus_mobile/base_url.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JadwalServices {
  // static final token = 'Bearer ${}';
  var role = AuthService.getUser().then((user) => user?['role']);

  static Future<JadwalModel> getJadwal(String role) async {
    var token = await AuthService.getToken();
    final urlMahasiswa = Uri.parse('$baseUrl/api/mahasiswa/jadwal');
    final urlDosen = Uri.parse('$baseUrl/api/dosen/jadwal');
    final url = (role == 'mahasiswa') ? urlMahasiswa : urlDosen;
    print("token : $token");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {

      var result = jsonDecode(response.body);
      print('Jadwal fetched successfully: ${result['data']}');
      return JadwalModel.fromJson(jsonDecode(response.body));
    }
    else {
      print('Failed to load jadwal: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load jadwal');
    }
  }
}
