import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluecampus_mobile/controller/navbar_controller.dart';
import 'package:bluecampus_mobile/view/component/navbar.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/frs_page.dart';
import 'package:bluecampus_mobile/view/frs_page/mahasiswa/frs_page.dart';
import 'package:bluecampus_mobile/view/jadwal_page/jadwal_page.dart';
import 'package:bluecampus_mobile/view/nilai_page/dosen/nilai_page_dosen.dart';
import 'package:bluecampus_mobile/view/nilai_page/mahasiswa/nilai_page_mahasiswa.dart';
import 'package:bluecampus_mobile/view/unidentified_role_page.dart';

import 'package:get/get_core/src/get_main.dart';

class PageSwitcher extends StatelessWidget {
  final String role;
  PageSwitcher({super.key, required this.role});

  var controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index:
                  (role == "mahasiswa" || role == "dosen")
                      ? controller.currentMenuIndex.value
                      : controller.unIdentifedIndex.value,
              children:
                  (role == "mahasiswa")
                      ? [
                        JadwalPage(role: role),
                        NilaiPageMahasiswa(),
                        FrsRoleMahasiswa(),
                      ]
                      : (role == "dosen")
                      ? [
                        JadwalPage(role: role),
                        NilaiPageDosen(),
                        FrsPageDosen(),
                      ]
                      : [UnIdentifiedRole()],
            ),
          ),
          const SafeArea(
            child: Align(alignment: Alignment.bottomCenter, child: Padding(
              
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Navbar(),
            )),
          ),
        ],
      ),
    );
  }
}
