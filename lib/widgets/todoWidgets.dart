import 'package:flutter/material.dart';
import 'package:todoappflutter/models/todo.dart';
import 'todoTile.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  List<Todo> todos = [
    Todo(name: 'Do the dishes'),
    Todo(name: 'Learn programming'),
    Todo(name: 'Go to'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
      return TodoTile(
          isChecked: todos[index].isDone,
          todoTitle: todos[index].name,
          checkBoxCallback: (bool checkBoxState){
            setState(() {
              todos[index].toggleDone();
            });
          }
      );
    }, itemCount: todos.length,);
  }
}

