class FrsMahasiswaModel {
  String? status;
  String? message;
  List<Frs>? listFrs;

  FrsMahasiswaModel({this.status, this.message, this.listFrs});

  FrsMahasiswaModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      listFrs = <Frs>[];
      json['data'].forEach((v) {
        listFrs!.add(Frs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] =status;
    data['message'] =message;
    if (this.listFrs != null) {
      data['data'] = listFrs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Frs {
  int? id;
  String? mataKuliah;
  String? kodeMatkul;
  int? semester;
  String? tahunAjaran;
  String? statusDisetujui;

  Frs(
      {this.id,
      this.mataKuliah,
      this.kodeMatkul,
      this.semester,
      this.tahunAjaran,
      this.statusDisetujui});

  Frs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mataKuliah = json['mata_kuliah'];
    kodeMatkul = json['kode_matkul'];
    semester = json['semester'];
    tahunAjaran = json['tahun_ajaran'];
    statusDisetujui = json['status_disetujui'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mata_kuliah'] = mataKuliah;
    data['kode_matkul'] = kodeMatkul;
    data['semester'] = semester;
    data['tahun_ajaran'] = tahunAjaran;
    data['status_disetujui'] = statusDisetujui;
    return data;
  }
}