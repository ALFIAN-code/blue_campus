import 'package:bluecampus_mobile/Models/nilai/detail_kelas_nilai_model.dart';
import 'package:bluecampus_mobile/services/nilai_dosen_services.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/detail_kelas.dart';
import 'package:get/get.dart';

class DetailKelasController extends GetxController {
  var isLoading = false.obs;

  var listMahasiwa = DetailKelasModel().obs;


  Future<void> getKelasDetail({
    required int kelasId,
    required int matkulId,
    required String semester,
    required String tahunAjaran,
  }) async {
    NilaiDosenServices.getDetailKelas(
          kelasId: kelasId,
          matkulId: matkulId,
          semester: semester.toLowerCase(),
          tahunAjaran: tahunAjaran,
        )
        .then((value) {
          listMahasiwa.value = DetailKelasModel();
          listMahasiwa.value = value;
          print(
            'Detail kelas fetched successfully: ${listMahasiwa.value.data?.length} items',
          );
        })
        .catchError((error) {
          print('Error fetching detail kelas: $error');
        }).whenComplete(() {
          isLoading.value = false;
        });
  }
}
