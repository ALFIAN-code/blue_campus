import 'package:bluecampus_mobile/controller/jadwal_controller.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';
import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/login/login.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JadwalPage extends StatefulWidget {
  final String role;
  JadwalPage({super.key, required this.role});

  @override
  State<JadwalPage> createState() => _JadwalPageState();
}

class _JadwalPageState extends State<JadwalPage> {
  var tahunAjaran = '2024/2025';
  var semester = 'Ganjil';
  var controller = Get.put(JadwalController());

  @override
  void initState() {
    // TODO: implement initState
    controller.getJadwal(widget.role);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Jadwal Mata Kuliah (${widget.role})',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) {
                        return AlertDialog(
                          title: Text('Konfirmasi Logout'),
                          content: Text('Apakah Anda yakin ingin keluar?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Get.offAll(LoginScreen());
                                // var logout = await AuthService.logout();
                                // if(logout) {
                                //   Get.offAll(() => LoginScreen());
                                // } else {
                                //   ScaffoldMessenger.of(context).showSnackBar(
                                //     SnackBar(content: Text('Logout gagal')),
                                //   );
                                // }
                              },
                              child: Text('Ya'),
                            ),
                          ],
                        );
                      });
                    },
                    icon: Icon(Icons.logout, color: Colors.red),
                  ),
                ],
              ),
              SizedBox(height: 10),

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
                'Jadwal',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Obx(() {
                  var filteredData = controller
                      .filterJadwalByTahunAjaranDanJenisSemester(
                        data: controller.jadwal.value.data,
                        tahunAjaran: tahunAjaran,
                        jenisSemester: semester,
                      );
print('Filtered data count: ${filteredData.length}');
                  List<String> hariList = [
                    'senin',
                    'selasa',
                    'rabu',
                    'kamis',
                    'jumat',
                  ];
                  if (controller.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 10),
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: hariList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(hariList[index]),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Divider(),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                                  controller
                                      .filterJadwalByHariFromList(
                                        list: filteredData,
                                        hari: hariList[index].toLowerCase(),
                                      )
                                      .map((item) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              filteredData[index].mataKuliah ??
                                                  'Matkul $index',
                                                  style: TextStyle(fontWeight: FontWeight.w700),
                                            ),
                                            (widget.role == 'mahasiswa')
                                                ? Text(
                                                  'Dosen: ${filteredData[index].dosen ?? 'Dosen $index'}',
                                                )
                                                : Text(
                                                  'Kelas: ${filteredData[index].kelas ?? 'Kelas $index'}',
                                                ),
                                            Text(
                                              'Ruang : ${filteredData[index].ruangan}, jam: ${filteredData[index].jamMulai} - ${filteredData[index].jamMulai}',
                                            ),
                                            SizedBox(height: 10),
                                          ],
                                        );
                                      })
                                      .toList(),
                            ),

                            
                          ],
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: 120,)
            ],
          ),
        ),
      ),
    );
  }
}
