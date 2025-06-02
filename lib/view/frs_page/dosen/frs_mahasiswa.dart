import 'package:bluecampus_mobile/controller/FRS/Detail_mahasiswa.dart';
import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailFrs extends StatefulWidget {
  const DetailFrs({
    super.key,
    required this.idMahasiswa,
    required this.namaMahasiswa,
    required this.nrp,
  });

  final int idMahasiswa;
  final String namaMahasiswa;
  final String nrp;

  @override
  State<DetailFrs> createState() => _DetailFrsState();
}

class _DetailFrsState extends State<DetailFrs> {
  var controller = Get.put(DetailMahasiswaFrs());

  @override
  void initState() {
    controller.getDetailMahasiswa(widget.idMahasiswa);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F9FC),
        title: Text('FRS Mahasiswa'),
      ),
      body: Obx(() {
        if (controller.listFrs.value.data == null) {
          return Center(child: Text('"Data tidak ditemukan"'));
        }

        return RefreshIndicator(
          onRefresh: () async {
            await controller.getDetailMahasiswa(widget.idMahasiswa);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                Text(
                  widget.namaMahasiswa,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'NRP :${widget.nrp}',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children:
                      controller.listFrs.value.data!.map((e) {
                        var status = e.statusDisetujui;
                        var listStatus = ['menunggu', 'ya', 'tidak'];
          
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.withAlpha(200),
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(
                                  " ${e.kodeMatkul}-${e.mataKuliah}" ?? '----',
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(e.dosen ?? 'Dosen tidak diketahui'),
                                    Text('${e.hari} ${e.jamMulai} - ${e.jamSelesai},'),
                                    Text('${e.sks} SKS'),
                                  ],
                                ),
                              ),
                              CustomDropDown(
                                value: status,
                                filledColor:
                                    (status == 'menunggu')
                                        ? Colors.yellow
                                        : (status == 'ya')
                                        ? Colors.green
                                        : Colors.red,
                                items: listStatus,
                                onChange: (value) {
                                  if (value == 'menunggu'){
                                    Get.snackbar('error', "Item tidak bisa di ubah ke status menunggu lagi", backgroundColor: Colors.red.withOpacity(0.5));
                                    return;
                                  }
                                  setState(() {
                                    controller.updateStatusFrs(
                                      idFrs: e.id!,
                                      status: value!,
                                      idMahasiswa: widget.idMahasiswa,
                                    );
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
