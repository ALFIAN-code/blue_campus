class FrsMahasiswaModel {
  String? status;
  String? message;
  List<FrsMahasiswaItem>? data;

  FrsMahasiswaModel({this.status, this.message, this.data});

  FrsMahasiswaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FrsMahasiswaItem>[];
      json['data'].forEach((v) {
        data!.add(FrsMahasiswaItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FrsMahasiswaItem {
  int? id;
  String? mataKuliah;
  String? kodeMatkul;
  int? sks;
  int? semester;
  String? tahunAjaran;
  String? dosen;
  String? hari;
  String? jamMulai;
  String? jamSelesai;
  String? statusDisetujui;

  FrsMahasiswaItem(
      {this.id,
      this.mataKuliah,
      this.kodeMatkul,
      this.sks,
      this.semester,
      this.tahunAjaran,
      this.dosen,
      this.hari,
      this.jamMulai,
      this.jamSelesai,
      this.statusDisetujui});

  FrsMahasiswaItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mataKuliah = json['mata_kuliah'];
    kodeMatkul = json['kode_matkul'];
    sks = json['sks'];
    semester = json['semester'];
    tahunAjaran = json['tahun_ajaran'];
    dosen = json['dosen'];
    hari = json['hari'];
    jamMulai = json['jam_mulai'];
    jamSelesai = json['jam_selesai'];
    statusDisetujui = json['status_disetujui'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mata_kuliah'] = mataKuliah;
    data['kode_matkul'] = kodeMatkul;
    data['sks'] = sks;
    data['semester'] = semester;
    data['tahun_ajaran'] = tahunAjaran;
    data['dosen'] = dosen;
    data['hari'] = hari;
    data['jam_mulai'] = jamMulai;
    data['jam_selesai'] = jamSelesai;
    data['status_disetujui'] = statusDisetujui;
    return data;
  }
}
