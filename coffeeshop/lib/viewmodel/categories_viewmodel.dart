import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoriesOptions extends GetxController {
  RxList<String> categoriesList =
      <String>[
        'Cappuccino',
        'Cold Brew',
        'Expresso',
        'Latte',
      ].obs;

  var selectedIndex = 0.obs;

   void selectCategory(int index) {
    selectedIndex.value = index;
  }
}




class SizeOptions extends GetxController {
  RxList<String> categoriesList =
      <String>[
        'Small',
        'Medium',
        'Large',
      ].obs;

  var selectedIndex = 0.obs;

   void selectCategory(int index) {
    selectedIndex.value = index;
  }
}
