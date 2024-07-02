// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class toDoPage extends StatefulWidget {
  const toDoPage({super.key});

  @override
  State<toDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<toDoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("hello WORLD"),
      ),
    );
  }
}
