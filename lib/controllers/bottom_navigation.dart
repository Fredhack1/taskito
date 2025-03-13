import 'package:get/get.dart';

// class BottomNavigationController extends GetxController {
//   RxInt _selectedIndex = 0.obs;

//   void _navigateBottomBar(int index) {
//     _selectedIndex.value = index;
//   }
// }

class BottomNavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  void changeIndex(int index) {
    if (index == 2) {
      return; // Empêche la sélection de l'index 3 (Settings)
    }
    selectedIndex.value = index;
    update();
  }
}
