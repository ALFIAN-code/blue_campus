import 'package:bluecampus_mobile/Models/FRS/frs_tersedia.dart';
import 'package:bluecampus_mobile/services/frs_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FrsMahasiswa extends GetxController {
  var frsTersedia = FrsMahasiswaModel().obs;
  var frsDiambil = FrsMahasiswaModel().obs;

  Future<void> getListFrsTersedia() async {
    try {
      frsTersedia.value = await FrsServices.getFrsTersediaMahasiswa();
    } catch (e) {
      throw Exception('Failed to load FRS data: $e');
    }
  }

  Future<void> getListFrsDiambil() async {
    try {
      frsDiambil.value = await FrsServices.getFrsDiambilMahasiswa();
    } catch (e) {
      throw Exception('Failed to load FRS data: $e');
    }
  }

  Future<void> ambilFrs(int id) async {
    try {
      var response = FrsServices.ambilFrs(id);

      debugPrint('FRS berhasil diambil: $response');
      Get.snackbar(
        'Berhasil',
        'FRS berhasil diambil',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.5),
      );
      getListFrsTersedia();
      getListFrsDiambil();
        } catch (e) {
      throw Exception('Failed to ambil FRS: $e');
    }
  }

  List<FrsMahasiswaItem> filterFrsByJenisSemester({
    required List<FrsMahasiswaItem>? list,
    required String tahunAjaran,
    required String jenisSemester, // "Ganjil" atau "Genap"
  }) {
    if (list == null) return [];

    final isGanjil = jenisSemester.toLowerCase() == 'ganjil';

    return list.where((item) {
      return item.tahunAjaran == tahunAjaran &&
          (isGanjil
              ? item.semester?.isOdd == true
              : item.semester?.isEven == true);
    }).toList();
  }
}
