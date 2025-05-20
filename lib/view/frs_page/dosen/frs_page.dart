import 'package:bluecampus_mobile/view/component/custom_dropdown.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/detail_kelas.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';

class FrsPageDosen extends StatelessWidget {
  FrsPageDosen({super.key});

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
            SizedBox(height: 20),
            Text(
              'Kelola FRS',
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
              'Daftar Kelas',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () {
                    print('tapped');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DetailKelas()),
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
                      title: Text('2 D3 IT B'),
                      subtitle: Text('28 Mahasiswa'),
                      trailing: Icon(Icons.arrow_forward_ios),
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
