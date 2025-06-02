import 'dart:convert';

import 'package:bluecampus_mobile/Models/nilai/detail_kelas_nilai_model.dart';
import 'package:bluecampus_mobile/Models/nilai/detail_mahasiswa_nilai.dart';
import 'package:bluecampus_mobile/Models/nilai/list_kelas_nilai.dart';
import 'package:bluecampus_mobile/base_url.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/detail_kelas.dart';
import 'package:http/http.dart' as http;

class NilaiDosenServices {
  static Future<ListKelasNilai> getListKelas() async {
    var token = await AuthService.getToken();
    final url = Uri.parse('$baseUrl/api/dosen/nilai');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print('list kelas fetched successfully: ${result['data'].length}');
      return ListKelasNilai.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load list kelas: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load jadwal');
    }
  }

  static Future<DetailKelasModel> getDetailKelas({
    required int kelasId,
    required int matkulId,
    required String tahunAjaran,
    required String semester,
  }) async {
    var token = await AuthService.getToken();
    final url = Uri.parse(
      '$baseUrl/api/dosen/nilai/mahasiswa?kelas_id=$kelasId&matkul_id=$matkulId&tahun_ajaran=$tahunAjaran&semester=$semester',
    );
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      print('list kelas fetched successfully: ${result['data'].length}');
      return DetailKelasModel.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to load list kelas: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to load jadwal');
    }
  }

  static Future<DetailMahasiswaNilai> getDetailMahasiswa(
    int mahasiswaId,
  ) async {
    var token = await AuthService.getToken();
    final url = Uri.parse('$baseUrl/api/dosen/nilai/mahasiswa/$mahasiswaId');
    final response = await http.get(
      url,
      headers: {'Authorization': 'Bearer $token', 'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      return DetailMahasiswaNilai.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load mahasiswa details');
    }
  }

  static Future<DetailMahasiswaNilai> updateNilaiMahasiswa({
    required int nilai,
    required int id,
  }) async {
    var token = await AuthService.getToken();
    print('token: $token');
    print('id: $id');
    final url = Uri.parse('$baseUrl/api/dosen/nilai/mahasiswa/$id/simpan');
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'nilai_angka': nilai}),
    );

    if (response.statusCode == 200) {
      print(response.body);
      print('Nilai updated successfully');
      return DetailMahasiswaNilai.fromJson(jsonDecode(response.body));
    } else {
      print('Failed to update nilai: ${response.statusCode}');
      print('Response body: ${response.body}');
      throw Exception('Failed to update nilai');
    }
  }
}
