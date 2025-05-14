import 'package:bluecampus_mobile/view/frs_page/frs_mahasiswa.dart';
import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';

class DetailKelas extends StatelessWidget {
  const DetailKelas({super.key});

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
      body: Padding(
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
              'kelas : 2 D3 IT B',
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
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
                      MaterialPageRoute(builder: (context) => FrsMahasiswa()),
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
                      title: Text('Bagus Alfian'),
                      subtitle: Text('3123500031'),
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
