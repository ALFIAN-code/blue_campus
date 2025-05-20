import 'package:bluecampus_mobile/controller/navbar_controller.dart';
import 'package:bluecampus_mobile/view/component/navbar.dart';
import 'package:bluecampus_mobile/view/frs_page/dosen/frs_page.dart';
import 'package:bluecampus_mobile/view/frs_page/mahasiswa/frs_page.dart';
import 'package:bluecampus_mobile/view/jadwal_page/jadwal_page.dart';
import 'package:bluecampus_mobile/view/nilai_page/nilai_page_dosen.dart';
import 'package:bluecampus_mobile/view/nilai_page/nilai_page_mahasiswa.dart';
import 'package:bluecampus_mobile/view/unidentified_role_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PageSwitcher extends StatelessWidget {
  PageSwitcher({super.key});

  var controller = Get.put(NavbarController());

  String role = 'Mahasiswa';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index:
                  (role == "Mahasiswa" || role == "Dosen")
                      ? controller.currentMenuIndex.value
                      : controller.unIdentifedIndex.value,
              children:
                  (role == "Mahasiswa")
                      ? [
                        JadwalPage(),
                        NilaiPageMahasiswa(),
                        FrsRoleMahasiswa(),
                        // FrsPageDosen()
                      ]
                      : (role == "Dosen")
                      ? [JadwalPage(), NilaiPageDosen(), FrsPageDosen()]
                      : [UnIdentifiedRole()],
            ),
          ),
          const SafeArea(
            child: Align(alignment: Alignment.bottomCenter, child: Navbar()),
          ),
        ],
      ),
    );
  }
}
