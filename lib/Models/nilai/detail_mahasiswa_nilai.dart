class DetailMahasiswaNilai {
  String? status;
  String? message;
  DataDetailMahasiswaNilai? data;

  DetailMahasiswaNilai({this.status, this.message, this.data});

  DetailMahasiswaNilai.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? DataDetailMahasiswaNilai.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataDetailMahasiswaNilai {
  String? nama;
  String? nrp;
  String? mataKuliah;
  String? kodeMatkul;
  String? nilaiHuruf;
  String? nilaiAngka;

  DataDetailMahasiswaNilai(
      {this.nama,
      this.nrp,
      this.mataKuliah,
      this.kodeMatkul,
      this.nilaiHuruf,
      this.nilaiAngka});

  DataDetailMahasiswaNilai.fromJson(Map<String, dynamic> json) {
    nama = json['nama'];
    nrp = json['nrp'];
    mataKuliah = json['mata_kuliah'];
    kodeMatkul = json['kode_matkul'];
    nilaiHuruf = json['nilai_huruf'];
    nilaiAngka = json['nilai_angka'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nama'] = nama;
    data['nrp'] = nrp;
    data['mata_kuliah'] = mataKuliah;
    data['kode_matkul'] = kodeMatkul;
    data['nilai_huruf'] = nilaiHuruf;
    data['nilai_angka'] = nilaiAngka;
    return data;
  }
}