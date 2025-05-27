import 'package:bluecampus_mobile/controller/nilai/detail_mahasiswa_nilai.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputNilai extends StatelessWidget {
  InputNilai({super.key, required this.id});
  int id;
  var controller = Get.put(DetailMahasiswaNilaiController());

  TextEditingController nilaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Input Nilai',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: GetX<DetailMahasiswaNilaiController>(
          init: DetailMahasiswaNilaiController(),
          initState: (state) => controller.getDetailMahasiswaNilai(id: id),
          builder: (_) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Mahasiswa',
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  controller.data.value.data?.mataKuliah ?? '',
                  style: TextStyle(fontSize: 16, color: textColor),
                ),
                Text(
                  '',
                  style: TextStyle(fontSize: 16, color: textColor),
                ),

                SizedBox(height: 20),
                Row(children: [Text('Nama : '), Text(controller.data.value.data?.nama ?? '')]),
                Row(children: [Text('NRP : '), Text(controller.data.value.data?.nrp ?? '')]),
                Row(children: [Text('Nilai : '), Text('${controller.data.value.data?.nilaiAngka} | ${controller.data.value.data?.nilaiHuruf}' ?? '')]),
                SizedBox(height: 20),
                SizedBox(
                  // height: 40,
                  child: TextField(
                    controller: nilaiController,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Masukan Nilai',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (nilaiController.text.isEmpty) {
                        Get.snackbar(
                          'Error',
                          'Nilai tidak boleh kosong',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }
                      if (int.tryParse(nilaiController.text) == null) {
                        Get.snackbar(
                          'Error',
                          'Nilai harus berupa angka',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }
                      if (int.parse(nilaiController.text) < 0 ||
                          int.parse(nilaiController.text) > 100) {
                        Get.snackbar(
                          'Error',
                          'Nilai harus antara 0 dan 100',
                          snackPosition: SnackPosition.BOTTOM,
                        );
                        return;
                      }
                      await controller.updateNilai(
                        id: id,
                        nilai: int.parse(nilaiController.text), // Replace with actual input value
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent.shade700,
                    ),
                    child: Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
