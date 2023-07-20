// ignore_for_file: public_member_api_docs, sort_constructors_first

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


  TodoModel({
    required this.id,
    required this.text,
    required this.isCompleted,
  });
}
