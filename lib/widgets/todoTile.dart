import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final bool isChecked;
  final String todoTitle;
  final Function checkBoxCallback;


  TodoTile({this.isChecked, this.todoTitle, this.checkBoxCallback});


  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todoTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
          activeColor: Colors.greenAccent[400],
          value: isChecked,
          onChanged: checkBoxCallback
      ),
    );
  }
}