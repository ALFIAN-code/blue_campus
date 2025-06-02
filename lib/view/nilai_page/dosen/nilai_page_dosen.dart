import 'package:bluecampus_mobile/Models/nilai/list_kelas_nilai.dart';
import 'package:bluecampus_mobile/controller/nilai/list_kelas_nilai_dosen_controller.dart';
import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/detail_kelas.dart';
import 'package:bluecampus_mobile/view/nilai_page/dosen/detail_kelas.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NilaiPageDosen extends StatefulWidget {
  NilaiPageDosen({super.key});

  @override
  State<NilaiPageDosen> createState() => _NilaiPageDosenState();
}

class _NilaiPageDosenState extends State<NilaiPageDosen> {
  var tahunAjaran = '2023/2024';

  var semester = 'Ganjil';

  var controller = Get.put(ListKelasNilaiDosen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      body: RefreshIndicator(
        onRefresh: ()async {
           controller.getListKelas();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Text(
                'Input Nilai',
                style: TextStyle(
                  color: textColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tahun ajaran',
                          style: TextStyle(color: textColor, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        CustomDropDown(
                          items: ['2023/2024', '2024/2025'],
                          onChange: (value) {
                            setState(() {
                              tahunAjaran = value!;
                            });
                          },
                          value: tahunAjaran,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Semester',
                          style: TextStyle(color: textColor, fontSize: 16),
                        ),
                        SizedBox(height: 5),
                        CustomDropDown(
                          items: ['Ganjil', 'Genap'],
                          onChange: (value) {
                            setState(() {
                              semester = value!;
                            });
                          },
                          value: semester,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Daftar Kelas',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                var filteredData = controller.filterKelasByJenisSemester(
                  list: controller.listKelas.value.data,
                  tahunAjaran: tahunAjaran,
                  jenisSemester: semester,
                );
                if (controller.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (filteredData.isEmpty) {
                  return Center(
                    child: Text(
                      'Tidak ada kelas yang tersedia',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 10),
        
                  itemCount: filteredData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
        
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        title: Text(
                          '${filteredData[index].namaKelas} - Semester ${filteredData[index].semester}' ??
                              'Kelas ${index + 1}',
                        ),
                        subtitle: Text(
                          "${filteredData[index].kodeMatkul} - ${filteredData[index].mataKuliah}" ??
                              'Mata Kuliah',
                        ),
                        trailing: Icon(Icons.arrow_forward),
                        onTap: () {
                          // Navigate to input nilai page
                          Get.to(() => NilaiKelas(
                            matkul: filteredData[index].mataKuliah!,
                            kelas: filteredData[index].namaKelas!,
                            idKelas:  filteredData[index].kelasId!,
                            tahunAjaran: tahunAjaran,
                            semester: semester,
                            idMatkul: filteredData[index].matkulId!,
                          ));
                          print('Tapped on ${filteredData[index].namaKelas}');
                        },
                      ),
                    );
                  },
                );
              }),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
