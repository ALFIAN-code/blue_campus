import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';

class FrsMahasiswa extends StatefulWidget {
  const FrsMahasiswa({super.key});

  @override
  State<FrsMahasiswa> createState() => _FrsMahasiswaState();
}

class _FrsMahasiswaState extends State<FrsMahasiswa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      appBar: AppBar(
        backgroundColor: Color(0xffF7F9FC),
        title: Text('FRS Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Text(
              'Bagus Alfian',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'NRP :3123500031',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(3, (index) {
                var status = 'belum disetujui';
                var listStatus = ['belum disetujui', 'disetujui', 'ditolak'];

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
                        title: Text('Workshop Pemrograman Perangkat Bergerak '),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Wiratmoko Yuwono S.T., M.T'),
                            Text('Selasa, 10:00 - 12:00, C102'),
                            Text('2 SKS'),
                          ],
                        ),
                      ),
                      CustomDropDown(
                        value: status,
                        filledColor:
                            (status == 'belum disetujui')
                                ? Colors.yellow.withAlpha(100)
                                : (status == 'disetujui')
                                ? Colors.green.withAlpha(100)
                                : Colors.red.withAlpha(100),
                        items: listStatus,
                        onChange: (value) {
                          // setState(() {
                          print(value);
                          status = value ?? 'belum disetujui';
                          // });
                        },
                      ),
                    ],
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
