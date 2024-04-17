import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_todolist/components/newTodo.dart';
import 'package:flutter_todolist/dataProvider.dart';
import 'package:flutter_todolist/model/todo.dart';

class TList extends StatefulWidget {
  const TList({super.key});

  @override
  State<StatefulWidget> createState() {
    return TListState();
  }
}

class TListState extends State<TList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My app"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push<Todo>(context,
                          MaterialPageRoute(builder: (context) => newTodo()))
                      .then((value) => setState(() {
                            value!.id = AppDataProvider.of(context)!
                                    .appData
                                    .todos
                                    .isNotEmpty
                                ? (AppDataProvider.of(context)!
                                        .appData
                                        .todos
                                        .map((e) => e.id)
                                        .reduce((value, element) => max(
                                              value,
                                              element,
                                            )) +
                                    1)
                                : 1;
                            AppDataProvider.of(context)!
                                .appData
                                .todos
                                .add(value);
                          }));
                },
                icon: const Icon(Icons.add))
          ],
        ),
        body: Table(
          children: [
            const TableRow(children: [
              Text("Название"),
              Text("Дедлайн"),
              Text("Приоритет"),
              TableCell(child: Text(""))
            ]),
            ...?AppDataProvider.of(context)
                ?.appData
                .todos
                .map((todo) => TableRow(children: [
                      Text(todo.title),
                      Text(todo.deadline?.toString().split(" ")[0] ?? ""),
                      Text(todo.priority.toString()),
                      Row(children: [
                        Text(todo.id.toString()),
                        IconButton(
                            onPressed: () {
                              Navigator.push<Todo>(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => newTodo(todo: todo)))
                                  .then((value) => setState(() {
                                        AppDataProvider.of(context)!
                                            .appData
                                            .todos
                                            .removeWhere((element) =>
                                                element.id == value!.id);
                                        AppDataProvider.of(context)!
                                            .appData
                                            .todos
                                            .add(value!);
                                      }));
                            },
                            icon: const Icon(Icons.edit)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                AppDataProvider.of(context)!
                                    .appData
                                    .todos
                                    .removeWhere(
                                        (element) => element.id == todo.id);
                              });
                            },
                            icon: const Icon(Icons.delete))
                      ])
                    ]))
          ],
        ));
  }
}
