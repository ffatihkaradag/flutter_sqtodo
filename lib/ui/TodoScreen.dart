import 'package:flutter/material.dart';
import 'package:flutter_sqtodo/data/todoService.dart';
import 'package:flutter_sqtodo/model/todo.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TodoService todoService = TodoService.instance;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final titleField = TextFormField(
      controller: titleController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );

    final descriptionField = TextFormField(
      controller: descriptionController,
      maxLines: 5,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );

    final saveButton = FlatButton(
      onPressed: () {
        todoService
            .addTodo(Todo(
                id: null,
                title: titleController.text,
                description: descriptionController.text,
                isDone: false))
            .then((value) => Navigator.pop(context));
      },
      child: Text(
        "Add",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Todo"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: titleField,
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: descriptionField,
          ),
          SizedBox(
            height: 10.0,
          ),
          saveButton,
        ],
      ),
    );
  }
}
