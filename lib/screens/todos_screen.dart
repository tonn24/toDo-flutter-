import 'package:flutter/material.dart';
import 'package:todoappflutter/widgets/todoList.dart';
import 'add_todo_screen.dart';
import 'package:todoappflutter/models/todo.dart';

class TaskScreen extends StatefulWidget {
  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Todo> todos = [
    Todo(name: 'Do the dishes'),
    Todo(name: 'Learn programming'),
    Todo(name: 'Go to'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[400],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen[400],
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context,
              isScrollControlled: true,
              builder: (BuildContext context) => SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTodoScreen((newTodoTitle){
                    setState(() {
                      todos.add(Todo(name: newTodoTitle));
                    });
                    Navigator.pop(context);
                  })
              )
          );
        }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding:
                EdgeInsets.only(top: 60.0, left: 30.0, right: 30, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: Colors.lightGreen[400],
                  ),
                  backgroundColor: Colors.white,
                  radius: 30.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todo App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Times New Roman'
                  ),
                ),
                Text('${todos.length} tasks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: TodoList(todos),
            ),
          ),
        ],
      ),
    );
  }
}