class JadwalModel {
  String? status;
  String? message;
  JadwalData? data;

  JadwalModel({this.status, this.message, this.data});

  factory JadwalModel.fromJson(Map<String, dynamic> json) {
    return JadwalModel(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? JadwalData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.toJson(),
    };
  }
}

class JadwalData {
  List<JadwalItem>? senin;
  List<JadwalItem>? selasa;
  List<JadwalItem>? rabu;
  List<JadwalItem>? kamis;
  List<JadwalItem>? jumat;

  JadwalData({this.senin, this.selasa, this.rabu, this.kamis, this.jumat});

  factory JadwalData.fromJson(Map<String, dynamic> json) {
    return JadwalData(
      senin: (json['senin'] as List<dynamic>?)
          ?.map((e) => JadwalItem.fromJson(e))
          .toList(),
      selasa: (json['selasa'] as List<dynamic>?)
          ?.map((e) => JadwalItem.fromJson(e))
          .toList(),
      rabu: (json['rabu'] as List<dynamic>?)
          ?.map((e) => JadwalItem.fromJson(e))
          .toList(),
      kamis: (json['kamis'] as List<dynamic>?)
          ?.map((e) => JadwalItem.fromJson(e))
          .toList(),
      jumat: (json['jumat'] as List<dynamic>?)
          ?.map((e) => JadwalItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'senin': senin?.map((e) => e.toJson()).toList(),
      'selasa': selasa?.map((e) => e.toJson()).toList(),
      'rabu': rabu?.map((e) => e.toJson()).toList(),
      'kamis': kamis?.map((e) => e.toJson()).toList(),
      'jumat': jumat?.map((e) => e.toJson()).toList(),
    };
  }
}
class JadwalItem {
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  String? ruangan;
  String? mataKuliah;
  String? kodeMatkul;
  int? sks;
  String? dosen; // ✅ tambahan baru
  String? kelas;
  int? semester;
  String? tahunAjaran;

  JadwalItem({
    this.hari,
    this.jamMulai,
    this.jamSelesai,
    this.ruangan,
    this.mataKuliah,
    this.kodeMatkul,
    this.sks,
    this.dosen,
    this.kelas,
    this.semester,
    this.tahunAjaran,
  });

  factory JadwalItem.fromJson(Map<String, dynamic> json) {
    return JadwalItem(
      hari: json['hari'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      ruangan: json['ruangan'],
      mataKuliah: json['mata_kuliah'],
      kodeMatkul: json['kode_matkul'],
      sks: json['sks'],
      dosen: json['dosen'], // ✅ ambil dari json
      kelas: json['kelas'],
      semester: json['semester'],
      tahunAjaran: json['tahun_ajaran'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hari': hari,
      'jam_mulai': jamMulai,
      'jam_selesai': jamSelesai,
      'ruangan': ruangan,
      'mata_kuliah': mataKuliah,
      'kode_matkul': kodeMatkul,
      'sks': sks,
      'dosen': dosen, // ✅ masukkan ke json
      'kelas': kelas,
      'semester': semester,
      'tahun_ajaran': tahunAjaran,
    };
  }
}