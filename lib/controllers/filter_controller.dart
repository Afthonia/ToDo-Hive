import 'package:get/state_manager.dart';

class FilterController extends GetxController {
  final isFiltered = false.obs;

  void toggle() {
    isFiltered.value = !isFiltered.value;
    isFiltered.refresh();
    print(isFiltered.value);
  }
}