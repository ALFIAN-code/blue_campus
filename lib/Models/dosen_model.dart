class DosenModel {
  final String id;
  final String nama;
  final String nip;
  final String noTelp;
  final String alamat;
  final String gelarDepan;
  final String gelarBelakang;
  final String jenisKelamin;
  final String programStudi;
  final String idUsers;

  DosenModel({
    required this.id,
    required this.nama,
    required this.nip,
    required this.noTelp,
    required this.alamat,
    required this.gelarDepan,
    required this.gelarBelakang,
    required this.jenisKelamin,
    required this.programStudi,
    required this.idUsers,
  });

  factory DosenModel.fromJson(Map<String, dynamic> json) => DosenModel(
    id: json['id'],
    nama: json['nama'],
    nip: json['nip'],
    noTelp: json['no_telp'],
    alamat: json['alamat'],
    gelarDepan: json['gelar_depan'],
    gelarBelakang: json['gelar_belakang'],
    jenisKelamin: json['jenis_kelamin'],
    programStudi: json['program_studi'],
    idUsers: json['id_users'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'nip': nip,
    'no_telp': noTelp,
    'alamat': alamat,
    'gelar_depan': gelarDepan,
    'gelar_belakang': gelarBelakang,
    'jenis_kelamin': jenisKelamin,
    'program_studi': programStudi,
    'id_users': idUsers,
  };
}
