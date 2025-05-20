import 'package:bluecampus_mobile/Models/dummy_data.dart';
import 'package:bluecampus_mobile/Models/frs_model.dart';
import 'package:bluecampus_mobile/Models/paket_frs_model.dart';
import 'package:get/get.dart';

class FrsMahasiswaController extends GetxController {
  final List<PaketFrsModel> dummyPaketFrsList = [
    PaketFrsModel(
      id: 'paket1',
      namaPaket: 'Paket Semester 4 - A',
      idKelas: 'kelas1',
    ),
    PaketFrsModel(
      id: 'paket2',
      namaPaket: 'Paket Semester 4 - B',
      idKelas: 'kelas2',
    ),
  ];

  var selectedFrs = Rx<List<FrsModel>>([]);

  final List<FrsModel> dummyFrsList = [
    FrsModel(
      id: 'frs1',
      hari: 'Senin',
      jamMulai: '08:00',
      jamSelesai: '09:40',
      semester: '4',
      kelas: '2 D3 IT A',
      idPaketFrs: 'paket1',
      idMatkul: 'M1',
      idDosen: 'dosen1',
    ),
    FrsModel(
      id: 'frs2',
      hari: 'Selasa',
      jamMulai: '10:00',
      jamSelesai: '11:40',
      semester: '4',
      kelas: '2 D3 IT A',
      idPaketFrs: 'paket1',
      idMatkul: 'M2',
      idDosen: 'dosen2',
    ),
    FrsModel(
      id: 'frs3',
      hari: 'Rabu',
      jamMulai: '13:00',
      jamSelesai: '14:40',
      semester: '4',
      kelas: '2 D3 IT A',
      idPaketFrs: 'paket1',
      idMatkul: 'M3',
      idDosen: 'dosen3',
    ),
    FrsModel(
      id: 'frs4',
      hari: 'Kamis',
      jamMulai: '08:00',
      jamSelesai: '09:40',
      semester: '4',
      kelas: '2 D3 IT B',
      idPaketFrs: 'paket2',
      idMatkul: 'M4',
      idDosen: 'dosen4',
    ),
    FrsModel(
      id: 'frs5',
      hari: 'Jumat',
      jamMulai: '10:00',
      jamSelesai: '11:40',
      semester: '4',
      kelas: '2 D3 IT B',
      idPaketFrs: 'paket2',
      idMatkul: 'M5',
      idDosen: 'dosen5',
    ),
  ];

  List<Map> dataForDropdown() {
    List<Map> kumpulanFrs = [];
    for (var frs in dummyFrsList) {
      var matakuliah = dummyMataKuliahList.firstWhere(
        (element) => element.id == frs.idMatkul,
      );
      kumpulanFrs.add({
        'idMatkul': matakuliah.id,
        'kodeMatkul': matakuliah.kodeMatkul,
        'namaMatkul': matakuliah.nama,
        'kelas': frs.kelas,
      });
    }
    return kumpulanFrs;
  }

  void addSelectedFrd(String id) {
    // selectedFrs.value.add(frs);
  }
}
