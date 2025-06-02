import 'package:bluecampus_mobile/controller/FRS/detail_kelas_dosen.dart';
import 'package:bluecampus_mobile/controller/nilai/detail_kelas_controller.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/frs_mahasiswa.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailKelas extends StatefulWidget {
  const DetailKelas({super.key, required this.idKelas, required this.kelas});

  final int idKelas;
  final String? kelas;
  @override
  State<DetailKelas> createState() => _DetailKelasState();
}

class _DetailKelasState extends State<DetailKelas> {
  // Example ID, replace with actual ID if needed

  var controller = Get.put(DetailKelasDosenFrs());

  @override
  void initState() {
    // TODO: implement initState
    controller.getDetailKelasDosen(widget.idKelas);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Color(0xffF7F9FC),
        title: Text(
          'Detail Kelas',
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getDetailKelasDosen(widget.idKelas);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                'Daftar Mahasiswa',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'kelas : ${widget.kelas}',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Obx(() {
                if (controller.listMahasiswa.value.data == null) {
                  return Center(child: CircularProgressIndicator());
                } else if (controller.listMahasiswa.value.data!.isEmpty) {
                  return Center(
                    child: Text('Tidak ada mahasiswa dalam kelas ini'),
                  );
                } else {
                  return Column(
                    children:
                        controller.listMahasiswa.value.data!.map((e) {
                          return GestureDetector(
                            onTap: () {
                              print('tapped');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => DetailFrs(
                                        idMahasiswa: e.id ?? 0,
                                        namaMahasiswa: e.nama ?? '-',
                                        nrp: e.nrp ?? '',
                                      ),
                                ),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.withAlpha(200),
                                  width: 1,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ListTile(
                                title: Text('${e.nama}'),
                                subtitle: Text('${e.nrp}'),
                                trailing: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          );
                        }).toList(),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
