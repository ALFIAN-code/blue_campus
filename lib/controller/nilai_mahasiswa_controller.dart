import 'package:bluecampus_mobile/Models/nilai_model.dart';
import 'package:bluecampus_mobile/services/nilai_mahasiswa_services.dart';
import 'package:get/get.dart';

class NilaiMahasiswaController extends GetxController {
  var nilai = NilaiModel().obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getNilai();
  }

  Future<void> getNilai() async {
    isLoading.value = true;
    try {
      // Simulate fetching data from a service
      // Replace this with your actual service call
      var fetchedNilai = await NilaiMahasiswaServices.getNilaiMahasiswa();

      print(
        'Nilai fetched successfully: ${nilai.value.data?[0].toString()} items',
      );
      nilai.value = fetchedNilai;
        } catch (e) {
      print('Error fetching nilai: $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<NilaiItem> filterNilaiByTahunAjaranDanJenisSemester({
    required List<NilaiItem>? list,
    required String tahunAjaran,
    required String jenisSemester, // 'Ganjil' atau 'Genap'
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
