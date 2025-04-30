import 'package:get/get.dart';

class NavbarController extends GetxController {
  var currentMenuIndex = 1.obs;

  void changeMenuIndex(int index) {
    currentMenuIndex.value = index;
  }
}
