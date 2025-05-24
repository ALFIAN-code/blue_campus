class NilaiModel {
  String? status;
  String? message;
  List<NilaiItem>? data;

  NilaiModel({this.status, this.message, this.data});

  factory NilaiModel.fromJson(Map<String, dynamic> json) {
    return NilaiModel(
      status: json['status'],
      message: json['message'],
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => NilaiItem.fromJson(e))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((e) => e.toJson()).toList(),
    };
  }
}

class NilaiItem {
  String? mataKuliah;
  String? kodeMatkul;
  String? nilaiHuruf;
  int? semester;
  String? tahunAjaran;

  NilaiItem({
    this.mataKuliah,
    this.kodeMatkul,
    this.nilaiHuruf,
    this.semester,
    this.tahunAjaran,
  });

  factory NilaiItem.fromJson(Map<String, dynamic> json) {
    return NilaiItem(
      mataKuliah: json['mata_kuliah'] ?? 'null',
      kodeMatkul: json['kode_matkul'] ?? 'null',
      nilaiHuruf: json['nilai_huruf'] ?? 'null',
      semester: json['semester'] ?? 0,
      tahunAjaran: json['tahun_ajaran'] ?? 'null',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'mata_kuliah': mataKuliah,
      'kode_matkul': kodeMatkul,
      'nilai_huruf': nilaiHuruf,
      'semester': semester,
      'tahun_ajaran': tahunAjaran,
    };
  }

  @override
  String toString() {
    return '[$tahunAjaran | Semester $semester] $mataKuliah ($kodeMatkul) = $nilaiHuruf';
  }
}
