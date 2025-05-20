class FrsModel {
  final String id;
  final String hari;
  final String jamMulai;
  final String jamSelesai;
  final String semester;
  final String kelas;
  final String idPaketFrs;
  final String idMatkul;
  final String idDosen;

  FrsModel({
    required this.id,
    required this.hari,
    required this.jamMulai,
    required this.jamSelesai,
    required this.semester,
    required this.kelas,
    required this.idPaketFrs,
    required this.idMatkul,
    required this.idDosen,
  });

  factory FrsModel.fromJson(Map<String, dynamic> json) => FrsModel(
    id: json['id'],
    hari: json['hari'],
    jamMulai: json['jam_mulai'],
    jamSelesai: json['jam_selesai'],
    semester: json['semester'],
    kelas: json['kelas'],
    idPaketFrs: json['id_paket_frs'],
    idMatkul: json['id_matkul'],
    idDosen: json['id_dosen'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'hari': hari,
    'jam_mulai': jamMulai,
    'jam_selesai': jamSelesai,
    'semester': semester,
    'kelas': kelas,
    'id_paket_frs': idPaketFrs,
    'id_matkul': idMatkul,
    'id_dosen': idDosen,
  };
}
