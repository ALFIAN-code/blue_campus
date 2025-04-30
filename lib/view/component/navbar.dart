import 'package:bluecampus_mobile/controller/navbar_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var navbarController = Get.put(NavbarController());

  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 80,
        padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: Color(0xff003366).withAlpha(200),
        ),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  navbarController.changeMenuIndex(1);
                },
                child: MenuItem(
                  currentIndex: navbarController.currentMenuIndex.value,
                  menuIndex: 1,
                  icon: Icons.list_rounded,
                  title: 'Jadwal',
                ),
              ),
              GestureDetector(
                onTap: () {
                  navbarController.changeMenuIndex(2);
                },
                child: MenuItem(
                  currentIndex: navbarController.currentMenuIndex.value,
                  menuIndex: 2,
                  icon: Icons.grade,
                  title: 'Nilai',
                ),
              ),
              GestureDetector(
                onTap: () {
                  navbarController.changeMenuIndex(3);
                },
                child: MenuItem(
                  menuIndex: 3,
                  currentIndex: navbarController.currentMenuIndex.value,
                  icon: Icons.list_rounded,
                  title: 'Jadwal',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.currentIndex,
    required this.icon,
    required this.title,
    required this.menuIndex,
  });

  final int currentIndex;
  final int menuIndex;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color:
              (currentIndex == menuIndex)
                  ? Colors.white
                  : Colors.white.withAlpha(100),
        ),
        Text(
          title,
          style: TextStyle(
            color:
                (currentIndex == menuIndex)
                    ? Colors.white
                    : Colors.white.withAlpha(100),
          ),
        ),
      ],
    );
  }
}
