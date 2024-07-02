// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:app/components/ToDoTile.dart';
import 'package:app/components/dailogBox.dart';
import 'package:flutter/material.dart';

class toDoPage extends StatefulWidget {
  const toDoPage({super.key});

  @override
  State<toDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<toDoPage> {
  final newTaskController = TextEditingController();

  List todoList = [
    ["do laundry", false]
  ];

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([newTaskController.text, false]);
      newTaskController.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      todoList.removeAt(index);
    });
  }

  void createNewTodo() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: newTaskController,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(76, 205, 153, 1),
          title: Text("To-Do App"),
        ),
        backgroundColor: Color.fromRGBO(0, 127, 115, 1),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Color.fromRGBO(255, 244, 85, 1),
          onPressed: createNewTodo,
        ),
        body: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
                taskName: todoList[index][0],
                taskCompleted: todoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteTask: (context) => deleteTask(index));
          },
        ));
  }
}
