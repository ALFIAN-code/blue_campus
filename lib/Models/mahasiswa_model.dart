class MahasiswaModel {
  final String id;
  final String nama;
  final String nrp;
  final String semester;
  final String tanggalLahir;
  final String tempatLahir;
  final String tanggalMasuk;
  final String status;
  final String jenisKelamin;
  final String alamat;
  final String noTelepon;
  final String asalSekolah;
  final String kelas;
  final String dosenWali;
  final String idUsers;

  MahasiswaModel({
    required this.id,
    required this.nama,
    required this.nrp,
    required this.semester,
    required this.tanggalLahir,
    required this.tempatLahir,
    required this.tanggalMasuk,
    required this.status,
    required this.jenisKelamin,
    required this.alamat,
    required this.noTelepon,
    required this.asalSekolah,
    required this.kelas,
    required this.dosenWali,
    required this.idUsers,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) => MahasiswaModel(
    id: json['id'],
    nama: json['nama'],
    nrp: json['nrp'],
    semester: json['semester'],
    tanggalLahir: json['tanggal_lahir'],
    tempatLahir: json['tempat_lahir'],
    tanggalMasuk: json['tanggal_masuk'],
    status: json['status'],
    jenisKelamin: json['jenis_kelamin'],
    alamat: json['alamat'],
    noTelepon: json['no_telepon'],
    asalSekolah: json['asal_sekolah'],
    kelas: json['kelas'],
    dosenWali: json['dosen_wali'],
    idUsers: json['id_users'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'nrp': nrp,
    'semester': semester,
    'tanggal_lahir': tanggalLahir,
    'tempat_lahir': tempatLahir,
    'tanggal_masuk': tanggalMasuk,
    'status': status,
    'jenis_kelamin': jenisKelamin,
    'alamat': alamat,
    'no_telepon': noTelepon,
    'asal_sekolah': asalSekolah,
    'kelas': kelas,
    'dosen_wali': dosenWali,
    'id_users': idUsers,
  };
}
