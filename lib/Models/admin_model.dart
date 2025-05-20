class AdminModel {
  final String id;
  final String nama;
  final String alamat;
  final String noTelepon;
  final String jenisKelamin;
  final String idUsers;

  AdminModel({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.noTelepon,
    required this.jenisKelamin,
    required this.idUsers,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) => AdminModel(
    id: json['id'],
    nama: json['nama'],
    alamat: json['alamat'],
    noTelepon: json['no_telepon'],
    jenisKelamin: json['jenis_kelamin'],
    idUsers: json['id_users'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'alamat': alamat,
    'no_telepon': noTelepon,
    'jenis_kelamin': jenisKelamin,
    'id_users': idUsers,
  };
}
