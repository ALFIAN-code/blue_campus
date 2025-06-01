import 'dart:convert';

import 'package:bluecampus_mobile/Models/nilai/nilai_model.dart';
import 'package:bluecampus_mobile/base_url.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';
import 'package:http/http.dart' as http;

class NilaiMahasiswaServices {

  static Future<NilaiModel> getNilaiMahasiswa() async {
    var token = await AuthService.getToken();
    final url = Uri.parse('$baseUrl/api/mahasiswa/nilai');
    print("token : $token");
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print('Nilai fetched successfully: ${result['data']}');
      return NilaiModel.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load nilai: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load nilai');
    }
  }
}