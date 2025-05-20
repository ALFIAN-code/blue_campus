class JadwalKuliahModel {
  final String id;
  final String ruangan;
  final String idFrs;

  JadwalKuliahModel({
    required this.id,
    required this.ruangan,
    required this.idFrs,
  });

  factory JadwalKuliahModel.fromJson(Map<String, dynamic> json) =>
      JadwalKuliahModel(
        id: json['id'],
        ruangan: json['ruangan'],
        idFrs: json['id_frs'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'ruangan': ruangan,
    'id_frs': idFrs,
  };
}
