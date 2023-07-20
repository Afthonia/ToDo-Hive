import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/filter_controller.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/widgets/add_task.dart';
import 'package:todo/constants.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/widgets/task_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());
    final filterController = Get.put(FilterController());

    return Scaffold(
      backgroundColor: Constants.thirdColor,
      appBar: AppBar(
        title: Text(
          'ToDo List',
          style: TextStyle(
            fontSize: 23.0,
            fontWeight: FontWeight.bold,
            color: Constants.secondaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Constants.mainColor,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20.0),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 11.0),
            child: Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: filterController.uncheckedTasks.value,
                    onChanged: (_) {
                      filterController.toggle();
                    },
                    checkColor: Constants.thirdColor,
                    activeColor: Constants.secondaryColor,
                  ),
                ),
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      taskController.searchText.value = value;
                    },
                    cursorColor: Constants.secondaryColor,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 25.0),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.secondaryColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Constants.secondaryColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.all(13.0),
                    child: Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          Obx(
            () => Expanded(
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: filterController.uncheckedTasks.value
                    ? taskController.tasks
                        .where((todo) => !todo!.isCompleted)
                        .where((todo) => todo!.text.toLowerCase().contains(
                            taskController.searchText.value.toLowerCase()))
                        .map((todo) => TaskCard(
                              todo: todo ?? TodoModel(id: 0, text: "No Task", isCompleted: false),
                            ))
                        .toList()
                    : taskController.tasks.isNotEmpty ? (taskController.tasks
                        .where((todo) => todo!.text.toLowerCase().contains(
                            taskController.searchText.value.toLowerCase()))
                        .map((todo) => TaskCard(
                              todo: todo ?? TodoModel(id: 0, text: "No Task", isCompleted: false),
                            ))
                        .toList()) : [],

              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(const AddTask());
        },
        backgroundColor: Constants.mainColor,
        child: Icon(
          Icons.add,
          color: Constants.secondaryColor,
        ),
      ),
    );
  }
}
