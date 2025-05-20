import 'package:get/get.dart';

class NavbarController extends GetxController {
  var currentMenuIndex = 0.obs;
  var unIdentifedIndex = 0.obs;

  void changeMenuIndex(int index) {
    currentMenuIndex.value = index;
  }
}
