import 'package:flutter/material.dart'; 

class TodoLogic with ChangeNotifier {
  final List<String> _todoList = <String>[];
  final TextEditingController _textController = TextEditingController();

  List<String> get toDoList => _todoList;
  TextEditingController get textController => _textController;

  void addTodoItem(String title) {
    if(title.trim().isNotEmpty){
      _todoList.add(title);
    }
    _textController.clear();
    notifyListeners();
  }
}