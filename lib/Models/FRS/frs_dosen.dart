class FrsKelasDosen {
  String? status;
  String? message;
  List<KelasItem>? listKelas;

  FrsKelasDosen({this.status, this.message, this.listKelas});

  FrsKelasDosen.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      listKelas = <KelasItem>[];
      json['data'].forEach((v) {
        listKelas!.add(KelasItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (listKelas != null) {
      data['data'] = listKelas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KelasItem {
  int? id;
  String? namaKelas;
  int? jumlahMahasiswa;

  KelasItem({this.id, this.namaKelas, this.jumlahMahasiswa});

  KelasItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKelas = json['nama_kelas'];
    jumlahMahasiswa = json['jumlah_mahasiswa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nama_kelas'] = namaKelas;
    data['jumlah_mahasiswa'] = jumlahMahasiswa;
    return data;
  }
}
