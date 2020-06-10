import 'package:flutter/material.dart';
import 'package:todoappflutter/widgets/todoList.dart';
import 'add_todo_screen.dart';
import 'package:provider/provider.dart';
import 'package:todoappflutter/models/todo_data.dart';
import '../constants.dart';

class TodoScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondBackgroundColor,
      floatingActionButton: FloatingActionButton(
        backgroundColor: buttonColor,
        child: Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(context: context,
              isScrollControlled: true,
              builder: (BuildContext context) => SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: AddTodoScreen()
          ));
        }
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/7.png'),
                fit: BoxFit.cover,
              )
            ),
            padding:
                EdgeInsets.only(top: 60.0, left: 30.0, right: 30, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  child: Icon(
                    Icons.list,
                    size: 40.0,
                    color: backgroundColor,
                  ),
                  backgroundColor: brightColor,
                  radius: 30.0,
                ),
                SizedBox(height: 10.0),
                Text(
                  'Todo                               ',
                  style: TextStyle(
                    color: brightColor,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Times New Roman'
                  ),
                ),
                Text('${Provider.of<TodoData>(context).todoCount} things to do',
                    style: TextStyle(
                      color: brightColor,
                      fontSize: 18.0, fontFamily: 'Times New Roman'
                    )),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              height: 300,
              decoration: BoxDecoration(
                color: brightColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0)),
              ),
              child: TodoList(),
            ),
          ),
        ],
      ),
    );
  }
}
