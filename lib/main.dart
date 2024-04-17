import 'package:flutter/material.dart';
import 'package:flutter_todolist/components/tlist.dart';
import 'package:flutter_todolist/dataProvider.dart';
import 'package:flutter_todolist/storage/spStorage.dart';
import 'package:flutter_todolist/utils.dart';

void main() {
  final SPStorage storage = SPStorage();

  AppData data;

  // ProcessSignal.sigterm.watch().listen((event) {
  //   storage.set("todos", JSONAbleList(list: data.todos));
  //  });

  
  data = AppData(storage: storage);

  runApp(AppDataProvider(
      appData: data,
      child: const Padding(padding: EdgeInsets.all(8.0), child: MainApp())));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
