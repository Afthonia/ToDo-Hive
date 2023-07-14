import 'package:get/state_manager.dart';
import 'package:todo/models/todo_model.dart';

class TaskController extends GetxController {
  final tasks = <TodoModel>[].obs;

  final searchText = "".obs;

  int idCounter = 1;

  void addTask(String task) {
    tasks.add(
      TodoModel(
        id: idCounter++,
        text: task,
        isCompleted: false,
      ),
    );
  }

  void deleteTask(int id) {
    tasks.removeWhere((todo) => todo.id == id);
  }

  void toggle(int id) {
    final todo = tasks.firstWhere((todo) => todo.id == id);
    todo.isCompleted = !todo.isCompleted;
    tasks.refresh();
  }
}
