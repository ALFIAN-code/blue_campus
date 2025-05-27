import 'package:bluecampus_mobile/Models/nilai/list_kelas_nilai.dart';
import 'package:bluecampus_mobile/services/nilai_dosen_services.dart';
import 'package:get/get.dart';

class ListKelasNilaiDosen extends GetxController {
  var listKelas = ListKelasNilai().obs;

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getListKelas();
  }

  void getListKelas() async {
    isLoading.value = true;
    await NilaiDosenServices.getListKelas()
        .then((value) {
          listKelas.value = value;
          print('List kelas fetched successfully: ${listKelas.value.data}');
        })
        .catchError((error) {
          print('Error fetching list kelas: $error');
        })
        .whenComplete(() {
          isLoading.value = false;
        });
  }

  List<DataKelas> filterKelasByJenisSemester({
    required List<DataKelas>? list,
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
