import 'package:flutter/material.dart';
import 'todoTile.dart';
import 'package:provider/provider.dart';
import 'package:todoappflutter/models/todo_data.dart';
import '../constants.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoData>(
      builder: (context, todoData, child) {
        return ListView.builder(
          itemBuilder: (context, index){
            final todo = todoData.todos[index];
            return Dismissible(
              key: UniqueKey(),
              child: TodoTile(
                  isChecked:  todo.isDone,
                  todoTitle: todo.name,
                  checkBoxCallback: (bool checkBoxState){
                    todoData.updateTodo(todoData.todos[index]);
                  }
              ),
              background: Container(
                color: brightColor,
                child: Icon(Icons.check),
              ),
              secondaryBackground: Container(
                color: redColor,
                child: Icon(Icons.cancel),
              ),
              onDismissed: (direction){
                if(direction == DismissDirection.endToStart){
                  todoData.deleteTodo(todo);
                }
              },
            );
          }, itemCount: todoData.todoCount,);
      },
    );
  }
}

