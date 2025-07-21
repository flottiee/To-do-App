import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logics/todo_logic.dart';

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoLogic = Provider.of<TodoLogic>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: ListView.builder(
        itemCount: todoLogic.toDoList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 8),
            child: Card(
              elevation: 0.5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(16),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  todoLogic.toDoList[index],
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  ),
                ),
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Add a new item"
        ),
        onPressed: () => _displayDialog(context),
        icon: Icon(Icons.add),
      ),
    );
  }

  Future<void> _displayDialog(BuildContext context) async {
    final todoLogic = Provider.of<TodoLogic>(context, listen: false);
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add a task'),
        content: TextField(
          controller: todoLogic.textController,
          decoration: InputDecoration(hintText: 'Enter task here'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              todoLogic.addTodoItem(todoLogic.textController.text);
            },
            child: Text('ADD'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('CANCEL'),
          ),
        ],
      ),
    );
  }
}