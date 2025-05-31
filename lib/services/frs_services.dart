import 'dart:convert';

import 'package:bluecampus_mobile/Models/nilai/list_kelas_nilai.dart';
import 'package:bluecampus_mobile/base_url.dart';
import 'package:bluecampus_mobile/Models/FRS/frs_tersedia.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class FrsServices {
  // Add your service methods here
  // For example, you might have methods to fetch data from an API, process it, etc.

  // Example method
  // static Future<FrsMahasiswaModel> gatDataKelas() async {
  //   var token = await AuthService.getToken();
  //   final url = Uri.parse('$baseUrl/api/dosen/frs/kelas');
  //   final response = await http.get(
  //     url,
  //     headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     var result = jsonDecode(response.body);
  //     debugPrint('list kelas fetched successfully: ${result['data'].length}');
  //     return FrsMahasiswaModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     debugPrint('Failed to load list kelas: ${response.statusCode}');
  //     debugPrint('Response body: ${response.body}');
  //     throw Exception('Failed to load jadwal');
  //   }
  // }

  static Future<FrsMahasiswaModel> getFrsTersediaMahasiswa() async {
    var token = await AuthService.getToken();
    final url = Uri.parse('$baseUrl/api/mahasiswa/frs/tersedia');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      debugPrint('list kelas fetched successfully: ${result['data'].length}');
      return FrsMahasiswaModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint('Failed to load list kelas: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      throw Exception('Failed to load jadwal');
    }
  }

  static Future<FrsMahasiswaModel> getFrsDiambilMahasiswa() async {
    var token = await AuthService.getToken();
    final url = Uri.parse('$baseUrl/api/mahasiswa/frs/diambil');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      debugPrint('list kelas fetched successfully: ${result['data'].length}');
      return FrsMahasiswaModel.fromJson(jsonDecode(response.body));
    } else {
      debugPrint('Failed to load list kelas: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      throw Exception('Failed to load jadwal');
    }
  }

  static Future ambilFrs(int id) async {
    var token = await AuthService.getToken();
    final url = Uri.parse('$baseUrl/api/mahasiswa/frs/ambil');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'frs_id': id}),
    );

    print('status code: ${response.statusCode}');

    if (response.statusCode == 200) {
      debugPrint('FRS successfully fetched: ${response.body}');
      return jsonDecode(response.body);
    } else {
      debugPrint('Failed to fetch FRS: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
      throw Exception('Failed to fetch FRS');
    }
  }

  getFrsDiambil() {}

  getListMahasiswa() async {}

  getDetailMahasiswa(String id) async {}
}
