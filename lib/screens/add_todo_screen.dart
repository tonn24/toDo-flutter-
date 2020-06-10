import 'package:flutter/material.dart';
import 'package:todoappflutter/models/todo_data.dart';
import 'package:provider/provider.dart';
import '../constants.dart';



class AddTodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String newTodoTitle;

    return Container(
      color: shadowColor,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: brightColor,
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
                color: darkColor,
                fontSize: 30,
                fontFamily: 'Times New Roman'
              ),
            ),
            TextField(
              autofocus: true,
              style: TextStyle(color: darkColor),
              textAlign: TextAlign.center,
              cursorColor: darkColor,
              onChanged: (newText){
                newTodoTitle = newText;
              },
            ),
            FlatButton(
              color: buttonColor,
              textColor: brightColor,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: backgroundColor,
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
