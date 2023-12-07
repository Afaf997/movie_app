
import 'package:get/state_manager.dart';

class NavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  void setIndex(int index) {
    currentIndex.value = index;
  }
}