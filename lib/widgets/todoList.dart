import 'package:flutter/material.dart';
import 'package:todoappflutter/models/todo.dart';
import 'todoTile.dart';
import 'package:todoappflutter/screens/todos_screen.dart';

class TodoList extends StatefulWidget {

  final List<Todo> todos;

  TodoList(this.todos);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index){
      return TodoTile(
          isChecked: widget.todos[index].isDone,
          todoTitle: widget.todos[index].name,
          checkBoxCallback: (bool checkBoxState){
            setState(() {
              widget.todos[index].toggleDone();
            });
          }
      );
    }, itemCount: widget.todos.length,);
  }
}

