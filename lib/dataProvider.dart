import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';
import 'package:flutter_todolist/storage/storage.dart';
import 'package:flutter_todolist/utils.dart';

class AppDataProvider extends InheritedWidget {
  const AppDataProvider(
      {required this.appData, required super.child, super.key});

  final AppData appData;

  static AppDataProvider? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppDataProvider>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class AppData {
  AppData({required this.storage}) {
    // storage.get<JSONAbleList<Todo>>("todos").then((value) => {
    //       if (value.isPresent())
    //         todos = value.get()!.list
    //     });
  }

  JSONIKVStorage storage;

  List<Todo> todos = List.empty(growable: true);
}
