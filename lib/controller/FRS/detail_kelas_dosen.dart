import 'package:bluecampus_mobile/Models/FRS/detail_kelas_dosen.dart';
import 'package:bluecampus_mobile/services/frs_services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class DetailKelasDosenFrs extends GetxController {
  // List of students in the class
  
var listMahasiswa = FrsDetailKelas().obs;

  Future<void> getDetailKelasDosen({required int id, required String tahunAjaran, required String semester}) async {
    try {
      listMahasiswa.value = await FrsServices.getDetailKelasFrs(id, tahunAjaran: tahunAjaran, semester: semester);
    } catch (e) {
      throw Exception('Failed to load Detail Kelas Dosen data: $e');
    }
  }

}