import 'package:bluecampus_mobile/controller/nilai/detail_kelas_controller.dart';
import 'package:bluecampus_mobile/view/nilai_page/dosen/input_nilai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class NilaiKelas extends StatefulWidget {
  const NilaiKelas({super.key, required this.idKelas, required this.idMatkul, required this.tahunAjaran, required this.semester, required this.kelas, required this.matkul});

  final int idKelas;
  final int idMatkul;
  final String tahunAjaran;
  final String semester;
  final String kelas;
  final String matkul;

  @override
  State<NilaiKelas> createState() => _NilaiKelasState();
}

class _NilaiKelasState extends State<NilaiKelas> {
  

  final controller = Get.put(DetailNilaiKelasController());
  @override
  void initState() {
    super.initState();
    controller.getKelasDetail(
      kelasId: widget.idKelas,
      matkulId: widget.idMatkul,
      semester: widget.semester,
      tahunAjaran: widget.tahunAjaran,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F9FC),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: const Color(0xffF7F9FC),
        title: const Text(
          'Detail Kelas',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Text(
              'Daftar Mahasiswa',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'kelas : ${widget.kelas}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              'Mata Kuliah : ${widget.matkul}',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Obx(()=> Column(
                children: List.generate(
                  controller.listMahasiwa.value.data?.length ?? 0,
                  (index) => GestureDetector(
                    onTap: () {
                      Get.to(InputNilai(id: controller.listMahasiwa.value.data![index].mahasiswaId!,));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.withAlpha(200),
                          width: 1,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.listMahasiwa.value.data?[index].namaMahasiswa ?? 'Nama Mahasiswa'),
                          Text(controller.listMahasiwa.value.data?[index].nilaiHuruf ?? '-'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}