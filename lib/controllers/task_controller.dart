import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:todo/models/todo_model.dart';

class TaskController extends GetxController {
  final tasks = <TodoModel?>[].obs;

  final searchText = "".obs;

  int idCounter = 1;

  Box<TodoModel> todoBox = Hive.box<TodoModel>('todos');

  @override
  void onInit() {
    super.onInit();
    openBox();
    getTasks();
  }

  void openBox() async {
    if (Hive.isBoxOpen('todos')) {
      print('the box is open now!');
    } else {
      await Hive.openBox('todos');
    }
  }

  Future<void> addTask(String task) async {
    TodoModel todo = TodoModel(id: idCounter++, text: task, isCompleted: false);

    tasks.add(todo);

    todoBox.put(todo.id, todo);
  }

  void getTasks() {

    for (int i = 1; i < todoBox.length; i++) {
      tasks.add(todoBox.get(i,
          defaultValue:
              TodoModel(id: 0, text: "Create A Task", isCompleted: false)));
    }

    print('the tasks are taken!');
  }

  void deleteTask(int id) {
    tasks.removeWhere((todo) => todo?.id == id);
    todoBox.delete(id);
  }

  void editTask(String text, int id) {
    TodoModel? todo = todoBox.get(id);

    todo?.text = text;
    todo?.save();
    tasks.refresh();
  }

  void toggle(int id) {
    final todo = todoBox.get(id);

    todo?.isCompleted = !todo.isCompleted;
    todo?.save();
  }
}
