import 'package:bluecampus_mobile/controller/navbar_controller.dart';
import 'package:bluecampus_mobile/view/component/navbar.dart';
import 'package:bluecampus_mobile/view/frs_page.dart';
import 'package:bluecampus_mobile/view/jadwal_page.dart';
import 'package:bluecampus_mobile/view/nilai_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lazy_indexed_stack/flutter_lazy_indexed_stack.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PageSwitcher extends StatelessWidget {
  PageSwitcher({super.key});

  var controller = Get.put(NavbarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: controller.currentMenuIndex.value,
              children: [JadwalPage(), NilaiPage(), FrsPage()],
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
