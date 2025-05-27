class ListKelasNilai {
  String? status;
  String? message;
  List<DataKelas>? data;

  ListKelasNilai({this.status, this.message, this.data});

  ListKelasNilai.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataKelas>[];
      json['data'].forEach((v) {
        data!.add(DataKelas.fromJson(v));
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

class DataKelas {
  int? kelasId;
  String? namaKelas;
  String? mataKuliah;
  int? matkulId;
  String? kodeMatkul;
  int? semester;
  String? tahunAjaran;

  DataKelas(
      {this.kelasId,
      this.namaKelas,
      this.mataKuliah,
      this.matkulId,
      this.kodeMatkul,
      this.semester,
      this.tahunAjaran});

  DataKelas.fromJson(Map<String, dynamic> json) {
    kelasId = json['kelas_id'];
    namaKelas = json['nama_kelas'];
    mataKuliah = json['mata_kuliah'];
    matkulId = json['matkul_id'];
    kodeMatkul = json['kode_matkul'];
    semester = json['semester'];
    tahunAjaran = json['tahun_ajaran'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kelas_id'] = kelasId;
    data['nama_kelas'] = namaKelas;
    data['mata_kuliah'] = mataKuliah;
    data['matkul_id'] = matkulId;
    data['kode_matkul'] = kodeMatkul;
    data['semester'] = semester;
    data['tahun_ajaran'] = tahunAjaran;
    return data;
  }
}