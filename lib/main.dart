import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/features/ToDo/logics/todo_logic.dart';
import 'features/ToDo/UI/homescreen.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoLogic(),
      child: MaterialApp(
        home: ToDoList(),
      ),
    ),
  );
}

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do',
      theme: ThemeData.from(colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)),
      darkTheme: ThemeData.dark(),
      home: ToDoList());
  }

}

