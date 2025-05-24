import 'package:bluecampus_mobile/Models/jadwal_model.dart';
import 'package:bluecampus_mobile/services/jadwal_services.dart';
import 'package:get/get.dart';

class JadwalController extends GetxController {
  var jadwal = Rx<JadwalModel>(JadwalModel());
  var isLoading = true.obs;

  getJadwal(String role) async {
    isLoading.value = true;

    // Reset jadwal to empty before fetching
    jadwal.value = JadwalModel(); // Reset jadwal to empty model
    try {
      jadwal.value = await JadwalServices.getJadwal(role);
      print('Jadwal fetched successfully: ${jadwal.value.data!.jumat?.length} items');
    } catch (e) {
      print('Error fetching jadwal: $e');
    } finally {
      isLoading.value = false;
    }
  }

  List<JadwalItem> filterJadwalByTahunAjaranDanJenisSemester({
    required JadwalData? data,
    required String tahunAjaran,
    required String jenisSemester, // 'Ganjil' atau 'Genap'
  }) {
    if (data == null) return [];

    final semuaJadwal = [
      ...?data.senin,
      ...?data.selasa,
      ...?data.rabu,
      ...?data.kamis,
      ...?data.jumat,
    ];

    // Ubah jenis semester ke angka genap/ganjil
    final isGanjil = jenisSemester.toLowerCase() == 'ganjil';

    return semuaJadwal.where((item) {
      return item.tahunAjaran == tahunAjaran &&
          (isGanjil ? item.semester!.isOdd : item.semester!.isEven);
    }).toList();
  }

  List<JadwalItem> filterJadwalByHariFromList({
    required List<JadwalItem> list,
    required String hari, // contoh: "senin", "jumat"
  }) {
    return list
        .where((item) => item.hari?.toLowerCase() == hari.toLowerCase())
        .toList();
  }
}
