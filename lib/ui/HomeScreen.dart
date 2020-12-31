import 'package:flutter/material.dart';
import 'package:flutter_sqtodo/data/todoService.dart';
import 'package:flutter_sqtodo/model/todo.dart';
import 'package:flutter_sqtodo/ui/TodoScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TodoService service = TodoService.instance;
  List<Todo> todos = [];
  List<Todo> doneTodos = [];

  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Todos"),
        bottom: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.check_box_outline_blank)),
            Tab(icon: Icon(Icons.check)),
          ],
        ),
      ),
      body: TabBarView(
        children: [
          getTodoList(todos),
          getTodoList(doneTodos),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
                  context, MaterialPageRoute(builder: (_) => TodoScreen()))
              .then((value) => loadData());
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget getTodoList(List<Todo> todos) {
    return Center(
      child: todos.length == 0
          ? Center(child: Text("not yet anymore"))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(todos[index].title),
                    subtitle: Text(todos[index].description),
                    trailing: Checkbox(
                        onChanged: (value) {
                          todos[index].isDone = value;
                          service
                              .updateIsDone(todos[index])
                              .then((value) => loadData());
                        },
                        value: todos[index].isDone),
                  ),
                );
              },
            ),
    );
  }

  loadData() {
    service.getTodos(true).then((value) {
      setState(() {
        todos = value;
      });
    });

    service.getTodos(false).then((value) {
      setState(() {
        doneTodos = value;
      });
    });
  }
}
