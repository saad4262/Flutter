import 'package:get/get.dart';

class SearchController extends GetxController {
  var searchText = ''.obs;

  void updateSearch(String value) {
    searchText.value = value;
  }
}
