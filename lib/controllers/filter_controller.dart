import 'package:get/state_manager.dart';

class FilterController extends GetxController {
  final uncheckedTasks = false.obs;

  void toggle() {
    uncheckedTasks.value = !uncheckedTasks.value;
    uncheckedTasks.refresh();
    print(uncheckedTasks.value);
  }
}