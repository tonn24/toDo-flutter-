import 'package:flutter/material.dart';
import 'package:todoappflutter/models/todo_data.dart';
import 'package:todoappflutter/widgets/todoList.dart';
import 'package:provider/provider.dart';
import 'package:todoappflutter/models/todo.dart';


class AddTodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTodoTitle;

    return Container(
      color: Color.fromRGBO(117, 117, 117, 1),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Todo',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightGreen[700],
                fontSize: 30,
                fontFamily: 'Times New Roman'
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText){
                newTodoTitle = newText;
              },
            ),
            FlatButton(
              color: Colors.lightGreen[600],
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.lightGreen[600],
              onPressed: () {
                Provider.of<TodoData>(context, listen: false).addTodo(newTodoTitle);
                Navigator.pop(context);
              },
              child: Text(
                'Add',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
