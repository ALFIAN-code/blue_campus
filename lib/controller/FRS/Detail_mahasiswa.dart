import 'package:bluecampus_mobile/Models/FRS/detail_mahasiswa_frs.dart';
import 'package:bluecampus_mobile/services/frs_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMahasiswaFrs extends GetxController {
  var listFrs = FrsDetailMahasiswa().obs;

  Future<void> getDetailMahasiswa({required int id,required String semester, required String tahunAjaran}) async {
    try {
      listFrs.value = await FrsServices.getDetailMahasiswa(id, semester: semester, tahunAjaran: tahunAjaran);
    } catch (e) {
      throw Exception('Failed to load Detail Mahasiswa data: $e');
    }
  }

  Future<void> updateStatusFrs({required int idMahasiswa, required String status, required int idFrs, required String semester, required String tahunAjaran}) async {
    try {
      await FrsServices.updateFrsMahasiswa(idFrs: idFrs, idMahasiswa: idMahasiswa, status: status);
      await getDetailMahasiswa(id: idMahasiswa, semester: semester, tahunAjaran: tahunAjaran);
      Get.snackbar(
        'Berhasil',
        'Status FRS berhasil diperbarui',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.5),
      );
    } catch (e) {
      Get.snackbar(
        'Gagal',
        'Gagal memperbarui status FRS: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.5),
      );
    }
  }
}
