import 'package:bluecampus_mobile/view/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InputNilai extends StatelessWidget {
  const InputNilai({super.key});

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
        child: Column(
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
              'Pemrograman Dasar',
              style: TextStyle(fontSize: 16, color: textColor),
            ),
            Text('3 D3 IT B', style: TextStyle(fontSize: 16, color: textColor)),

            SizedBox(height: 20),
            Row(children: [Text('Nama : '), Text('Bagus alfian')]),
            Row(children: [Text('NRP : '), Text('3123500031')]),
            SizedBox(height: 20),
            SizedBox(
              // height: 40,
              child: TextField(
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
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade700
                ),
                child: Text('Simpan', style: TextStyle(
                  color: Colors.white
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
