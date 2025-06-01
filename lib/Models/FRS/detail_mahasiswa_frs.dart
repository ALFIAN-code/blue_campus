class FrsDetailMahasiswa {
  String? status;
  String? message;
  List<FrsItem>? data;

  FrsDetailMahasiswa({this.status, this.message, this.data});

  FrsDetailMahasiswa.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FrsItem>[];
      json['data'].forEach((v) {
        data!.add(FrsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FrsItem {
  int? id;
  String? mataKuliah;
  String? kodeMatkul;
  int? semester;
  String? tahunAjaran;
  String? statusDisetujui;

  FrsItem(
      {this.id,
      this.mataKuliah,
      this.kodeMatkul,
      this.semester,
      this.tahunAjaran,
      this.statusDisetujui});

  FrsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mataKuliah = json['mata_kuliah'];
    kodeMatkul = json['kode_matkul'];
    semester = json['semester'];
    tahunAjaran = json['tahun_ajaran'];
    statusDisetujui = json['status_disetujui'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['mata_kuliah'] = mataKuliah;
    data['kode_matkul'] = kodeMatkul;
    data['semester'] = semester;
    data['tahun_ajaran'] = tahunAjaran;
    data['status_disetujui'] = statusDisetujui;
    return data;
  }
}
