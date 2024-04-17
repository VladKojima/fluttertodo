import 'package:flutter/material.dart';
import 'package:flutter_todolist/model/todo.dart';

class newTodo extends StatefulWidget {
  newTodo({super.key, this.todo});

  final Todo? todo;

  @override
  State<StatefulWidget> createState() {
    return newTodoState(todo);
  }
}

class newTodoState extends State<newTodo> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _priorityController = TextEditingController();

  newTodoState(Todo? todo) {
    this.todo = todo ?? Todo(id: 0, priority: 0, title: "");

    _titleController.text = this.todo.title;
    _priorityController.text = this.todo.priority.toString();
  }

  late Todo todo;

  int? lastNumber;

  DateTime? date;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
              key: _formKey,
              child: Column(
                  children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Задача"),
                  controller: _titleController,
                  onChanged: (value) {
                    todo.title = _titleController.text;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _priorityController,
                  decoration: const InputDecoration(labelText: "Приоритет"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Введите приоритет",
                  onChanged: (value) {
                    if (!RegExp(r"^[0-9]+$").hasMatch(value)) {
                      _priorityController.text = lastNumber?.toString() ?? "";
                    } else {
                      lastNumber = int.tryParse(value);
                      todo.priority = lastNumber!;
                    }
                  },
                ),
                TextButton(
                    onPressed: () {
                      showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)))
                          .then((value) => setState(() {
                                date = value;
                              }));
                    },
                    child: date != null
                        ? Text(date!.toString().split(" ")[0])
                        : const Text("Выберите дедлайн")),
                ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pop(context, todo);
                      }
                    },
                    child: const Text('Создать'))
              ]
                      .map((widget) => Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 0),
                          child: widget))
                      .toList()))),
    );
  }
}
