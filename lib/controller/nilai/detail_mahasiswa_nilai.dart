import 'package:bluecampus_mobile/Models/nilai/detail_mahasiswa_nilai.dart';
import 'package:bluecampus_mobile/services/nilai_dosen_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMahasiswaNilaiController extends GetxController {
  var isLoading = false.obs;

  var data = DetailMahasiswaNilai().obs;

  Future<void> getDetailMahasiswaNilai({required int id}) async {
    isLoading.value = true;
    try {
      data.value = await NilaiDosenServices.getDetailMahasiswa(id);
      print(
        'Detail mahasiswa nilai fetched successfully: ${data.value.data?.nama} items',
      );
    } catch (error) {
      print('Error fetching detail mahasiswa nilai: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateNilai({required int id, required int nilai}) async {
    isLoading.value = true;
    try {
      var response = await NilaiDosenServices.updateNilaiMahasiswa(
        id: id,
        nilai: nilai,
      );
      print('Nilai mahasiswa updated successfully');
      await getDetailMahasiswaNilai(id: id);
      Get.snackbar('Success', 'Data nilai mahasiswa berhasil diperbarui',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.8),
          colorText: Colors.white);
    } catch (error) {
      print('Error updating nilai mahasiswa: $error');
      Get.snackbar('Error', 'Gagal memperbarui data nilai mahasiswa',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}
