import 'package:bluecampus_mobile/Models/FRS/frs_dosen.dart';
import 'package:bluecampus_mobile/services/frs_services.dart';
import 'package:get/get.dart';

class KelasFrsControllerFrs extends GetxController {
  var listkelas = (FrsKelasDosen()).obs;

  @override
  onInit() {
    getListKelasDosen();
    super.onInit();
  }

  Future<void> getListKelasDosen() async {
    try {
      listkelas.value = await FrsServices.getListKelasDosen();
    } catch (e) {
      throw Exception('Failed to load Kelas Dosen data: $e');
    }
  }
}
