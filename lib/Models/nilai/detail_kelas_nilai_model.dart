class DetailKelasModel {
  String? status;
  String? message;
  List<DataDetail>? data;

  DetailKelasModel({this.status, this.message, this.data});

  DetailKelasModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <DataDetail>[];
      json['data'].forEach((v) {
        data!.add(DataDetail.fromJson(v));
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

class DataDetail {
  int? frsMahasiswaId;
  int? mahasiswaId;
  String? namaMahasiswa;
  String? nrp;
  String? nilaiHuruf;

  DataDetail(
      {this.frsMahasiswaId,
      this.mahasiswaId,
      this.namaMahasiswa,
      this.nrp,
      this.nilaiHuruf});

  DataDetail.fromJson(Map<String, dynamic> json) {
    frsMahasiswaId = json['frs_mahasiswa_id'];
    mahasiswaId = json['mahasiswa_id'];
    namaMahasiswa = json['nama_mahasiswa'];
    nrp = json['nrp'];
    nilaiHuruf = json['nilai_huruf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['frs_mahasiswa_id'] = frsMahasiswaId;
    data['mahasiswa_id'] = mahasiswaId;
    data['nama_mahasiswa'] = namaMahasiswa;
    data['nrp'] = nrp;
    data['nilai_huruf'] = nilaiHuruf;
    return data;
  }
}