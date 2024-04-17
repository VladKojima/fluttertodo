import 'package:flutter_todolist/utils.dart';

class Todo implements IJSONable{
  int id;
  String title;
  int priority;
  DateTime? deadline;

  Todo({required this.id, required this.title, required this.priority, this.deadline});

  @override
  Map toJson() => {
    title: title,
    priority: priority,
    deadline: deadline.toString()
  };
}