class MataKuliahModel {
  final String id;
  final String kodeMatkul;
  final String nama;
  final String jenisMatkul;
  final String sks;

  MataKuliahModel({
    required this.id,
    required this.kodeMatkul,
    required this.nama,
    required this.jenisMatkul,
    required this.sks,
  });

  factory MataKuliahModel.fromJson(Map<String, dynamic> json) =>
      MataKuliahModel(
        id: json['id'],
        kodeMatkul: json['kode_matkul'],
        nama: json['nama'],
        jenisMatkul: json['jenis_matkul'],
        sks: json['sks'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'kode_matkul': kodeMatkul,
    'nama': nama,
    'jenis_matkul': jenisMatkul,
    'sks': sks,
  };
}
