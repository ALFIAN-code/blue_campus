import 'package:bluecampus_mobile/Models/FRS/detail_kelas_dosen.dart';
import 'package:bluecampus_mobile/services/frs_services.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';


class DetailKelasDosenFrs extends GetxController {
  // List of students in the class
  
var listMahasiswa = FrsDetailKelas().obs;

  Future<void> getDetailKelasDosen(int id) async {
    try {
      listMahasiswa.value = await FrsServices.getDetailKelasFrs(id);
    } catch (e) {
      throw Exception('Failed to load Detail Kelas Dosen data: $e');
    }
  }

}