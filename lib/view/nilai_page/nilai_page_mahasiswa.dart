import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';

class NilaiPageMahasiswa extends StatelessWidget {
  NilaiPageMahasiswa({super.key});

  var tahunAjaran = '2024/2025';
  var semester = 'Ganjil';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F9FC),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 100),
            Text(
              'Nilai Per Semester',
              style: TextStyle(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
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
                        onChange: (value) {},
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
                        onChange: (value) {},
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
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey),
                ),
                child: ListView.separated(
                  itemCount: 10,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder:
                      (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Divider(),
                      ),
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Expanded(child: Text('Workshop Pengalaman Pengguna')),
                        SizedBox(width: 20),
                        Text("A+", style: TextStyle(color: Colors.green)),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
