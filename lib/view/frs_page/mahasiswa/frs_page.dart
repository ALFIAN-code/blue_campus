import 'package:bluecampus_mobile/controller/FRS/frs_mahasiswa.dart';
import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FrsRoleMahasiswa extends StatefulWidget {
  FrsRoleMahasiswa({super.key});

  @override
  State<FrsRoleMahasiswa> createState() => _FrsRoleMahasiswaState();
}

class _FrsRoleMahasiswaState extends State<FrsRoleMahasiswa> {
  var controllerFrsMahasiswa = Get.put(FrsMahasiswa());

  var tahunAjaran = '2024/2025';

  var semester = 'Ganjil';

  var selectedMatkul;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState called');
    controllerFrsMahasiswa.getListFrsTersedia();
    controllerFrsMahasiswa.getListFrsDiambil();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('Tahun Ajaran: $tahunAjaran, Semester: $semester');
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: RefreshIndicator(
            onRefresh: () async {
              await controllerFrsMahasiswa.getListFrsTersedia();
              await controllerFrsMahasiswa.getListFrsDiambil();
              setState(() {});
            },
            child: ListView(
              children: [
                SizedBox(height: 20),
                Text(
                  'Formulir Rencana Studi',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10),
                Text('Dosen Wali : Adam Shidqul Aziz,S.ST., M.T'),
                Text('IPK / IPS (semester lalu) : 3.42 / 3.34'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Pengisian:'),
                    Text('03 Februari 2025 - 07 Februari 2025'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Perubahan:'),
                    Text('10 Februari 2025 - 28 Februari 2025'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Drop:'), Text('03 Maret 2025 - 16 Mei 2025')],
                ),
                SizedBox(height: 20),
                Obx((){
                  var filteredData = controllerFrsMahasiswa.filterFrsByJenisSemester(
                    list: controllerFrsMahasiswa.frsTersedia.value.listFrs,
                    tahunAjaran: tahunAjaran,
                    jenisSemester: semester,
                  );
                  return CustomDropDown(
                    value: selectedMatkul,
                    items:
                       filteredData.map(
                              (e) =>
                                  '(${e.id}) ${e.kodeMatkul} ${e.mataKuliah}- ${e.semester} ',
                            )
                            .toList(),
                    onChange: (value) {
                      selectedMatkul = value;
                      print(selectedMatkul);
                    },
                  );
                },
                ),
            
                SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff003366),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () async {
                      await controllerFrsMahasiswa.ambilFrs(
                        int.parse(selectedMatkul.split(' ')[0].replaceAll('(', '').replaceAll(')', '')),
                      );
                      // print(int.parse(selectedMatkul.split(' ')[0].replaceAll('(', '').replaceAll(')', '')));
                    },
                    child: Text(
                      "Tambah Matkul",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            
                SizedBox(height: 20),
                Column(
                  children: [
                    Obx(() {
                      var filteredData = controllerFrsMahasiswa.filterFrsByJenisSemester(
                        list: controllerFrsMahasiswa.frsDiambil.value.listFrs,
                        tahunAjaran: tahunAjaran,
                        jenisSemester: semester,
                      );
                      return controllerFrsMahasiswa.frsDiambil.value.listFrs ==
                              null
                          ? Text('Tidak ada mata kuliah yang dipilih')
                          : ListView.separated(
                            separatorBuilder: (_, __) => SizedBox(height: 10),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount:
                                filteredData
                                    .length,
                            itemBuilder: (context, index) {
                              var frs =
                                  filteredData[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${frs.kodeMatkul} ${frs.mataKuliah}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    // Text(
                                    //   'Kelas: ${frs.}',
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w400,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   'Dosen: ${frs.}',
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w400,
                                    //   ),
                                    // ),
                                    // Text(
                                    //   '${frs.hari} ${frs.jamMulai} - ${frs.jamSelesai}',
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w400,
                                    //   ),
                                    // ),
                                    // SizedBox(height: 5),
                                    // Text(
                                    //   'SKS: ${matakuliah.sks}',
                                    //   style: TextStyle(
                                    //     fontSize: 14,
                                    //     fontWeight: FontWeight.w600,
                                    //   ),
                                    // ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: frs.statusDisetujui == 'ya'
                                            ? Colors.green.withOpacity(0.1)
                                            : frs.statusDisetujui == 'tidak'
                                                ? Colors.red.withOpacity(0.1)
                                                : Colors.grey.withOpacity(0.3),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      child: Text(frs.statusDisetujui ?? 'Belum Disetujui',
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                    }),
                    SizedBox(height: 120),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
