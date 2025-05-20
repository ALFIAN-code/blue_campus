class FrsMahasiswaModel {
  final String id;
  final bool statusDisetujui;
  final String catatan;
  final String idMahasiswa;
  final String idFrs;

  FrsMahasiswaModel({
    required this.id,
    required this.statusDisetujui,
    required this.catatan,
    required this.idMahasiswa,
    required this.idFrs,
  });

  factory FrsMahasiswaModel.fromJson(Map<String, dynamic> json) =>
      FrsMahasiswaModel(
        id: json['id'],
        statusDisetujui: json['status_disetujui'],
        catatan: json['catatan'],
        idMahasiswa: json['id_mahasiswa'],
        idFrs: json['id_frs'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'status_disetujui': statusDisetujui,
    'catatan': catatan,
    'id_mahasiswa': idMahasiswa,
    'id_frs': idFrs,
  };
}
