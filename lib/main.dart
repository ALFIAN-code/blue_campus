import 'package:bluecampus_mobile/view/component/navbar.dart';
import 'package:bluecampus_mobile/view/jadwal_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          JadwalPage(),
          Align(alignment: Alignment.bottomCenter, child: Navbar()),
        ],
      ),
    );
  }
}
