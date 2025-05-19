import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bluecampus_mobile/controller/navbar_controller.dart';
import 'package:bluecampus_mobile/view/component/navbar.dart';
import 'package:bluecampus_mobile/view/frs_page/frs_page.dart';
import 'package:bluecampus_mobile/view/jadwal_page/jadwal_page.dart';
import 'package:bluecampus_mobile/view/nilai_page/nilai_page_mahasiswa.dart';
import 'package:bluecampus_mobile/services/auth_services.dart';

class PageSwitcher extends StatefulWidget {
  final String role;
  const PageSwitcher({super.key, required this.role});

  @override
  State<PageSwitcher> createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<PageSwitcher> {
  final controller = Get.put(NavbarController());
  Map<String, dynamic>? user;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    final data = await AuthService.getUser();
    setState(() {
      user = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: controller.currentMenuIndex.value,
              children: [
                JadwalPage(role: widget.role),
                NilaiPage(role: widget.role),
                FrsPage(role: widget.role),
              ],
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
