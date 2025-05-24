import 'dart:ui';

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
    return Container(
      height: 80,
      clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
      child: Stack(
        children: [
          BackdropFilter(filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), child: Container(),),
          Container(
            height: 80,
            padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
            
          
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff003366).withAlpha(200),
                  Color(0xff003366).withAlpha(150),
                ],
              ),
            ),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      navbarController.changeMenuIndex(0);
                    },
                    child: MenuItem(
                      currentIndex: navbarController.currentMenuIndex.value,
                      menuIndex: 0,
                      icon: Icons.list_rounded,
                      title: 'Jadwal',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navbarController.changeMenuIndex(1);
                    },
                    child: MenuItem(
                      currentIndex: navbarController.currentMenuIndex.value,
                      menuIndex: 1,
                      icon: Icons.grade,
                      title: 'Nilai',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      navbarController.changeMenuIndex(2);
                    },
                    child: MenuItem(
                      menuIndex: 2,
                      currentIndex: navbarController.currentMenuIndex.value,
                      icon: Icons.list_alt_rounded,
                      title: 'FRS',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
