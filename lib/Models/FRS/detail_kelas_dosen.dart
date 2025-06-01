class FrsDetailKelas {
  String? status;
  String? message;
  List<MahasiswaItem>? data;

  FrsDetailKelas({this.status, this.message, this.data});

  FrsDetailKelas.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <MahasiswaItem>[];
      json['data'].forEach((v) {
        data!.add(MahasiswaItem.fromJson(v));
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

class MahasiswaItem {
  int? id;
  String? nama;
  String? nrp;
  String? kelas;

  MahasiswaItem({this.id, this.nama, this.nrp, this.kelas});

  MahasiswaItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['nama'];
    nrp = json['nrp'];
    kelas = json['kelas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama'] = nama;
    data['nrp'] = nrp;
    data['kelas'] = kelas;
    return data;
  }
}