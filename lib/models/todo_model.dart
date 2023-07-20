// ignore_for_file: public_member_api_docs, sort_constructors_first
<<<<<<< HEAD

import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 1)
class TodoModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  String text;

  @HiveField(2, defaultValue: false)
  bool isCompleted;

=======
class TodoModel {
  final int id;
  final String text;
  bool isCompleted;
>>>>>>> 229d494182991277c06b0887591032f0e2ccca12
  TodoModel({
    required this.id,
    required this.text,
    required this.isCompleted,
  });
<<<<<<< HEAD
}
=======
}
>>>>>>> 229d494182991277c06b0887591032f0e2ccca12
