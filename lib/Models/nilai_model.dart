class NilaiModel {
  final String id;
  final String nilaiAngka;
  final String nilaiHuruf;
  final String idFrsMahasiswa;

  NilaiModel({
    required this.id,
    required this.nilaiAngka,
    required this.nilaiHuruf,
    required this.idFrsMahasiswa,
  });

  factory NilaiModel.fromJson(Map<String, dynamic> json) => NilaiModel(
    id: json['id'],
    nilaiAngka: json['nilai_angka'],
    nilaiHuruf: json['nilai_huruf'],
    idFrsMahasiswa: json['id_frs_mahasiswa'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nilai_angka': nilaiAngka,
    'nilai_huruf': nilaiHuruf,
    'id_frs_mahasiswa': idFrsMahasiswa,
  };
}
