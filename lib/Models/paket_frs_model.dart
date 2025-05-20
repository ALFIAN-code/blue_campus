class PaketFrsModel {
  final String id;
  final String namaPaket;
  final String idKelas;

  PaketFrsModel({
    required this.id,
    required this.namaPaket,
    required this.idKelas,
  });

  factory PaketFrsModel.fromJson(Map<String, dynamic> json) => PaketFrsModel(
    id: json['id'],
    namaPaket: json['nama_paket'],
    idKelas: json['id_kelas'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nama_paket': namaPaket,
    'id_kelas': idKelas,
  };
}
