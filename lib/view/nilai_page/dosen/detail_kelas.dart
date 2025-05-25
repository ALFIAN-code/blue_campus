import 'package:bluecampus_mobile/view/nilai_page/dosen/input_nilai.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class NilaiKelas extends StatelessWidget {
  const NilaiKelas({super.key});

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
            const Text(
              'kelas : 2 D3 IT B',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Mata Kuliah : Pemrograman Dasar',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () {
                    Get.to(InputNilai());
                    // Navigate to detail page
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
                        Text('Mahasiswa ${index + 1}'),
                        Text(' A+ '),
                      ],
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