import 'todo.dart';
import 'package:flutter/foundation.dart';
import 'dart:collection';

class TodoData extends ChangeNotifier {
  List<Todo> _todos = [
    Todo(name: 'Do the dishes'),
    Todo(name: 'Learn programming'),
    Todo(name: 'Go to'),
  ];

  List<Todo> get todos {
    return UnmodifiableListView(_todos);
  }

  int get todoCount {
    return _todos.length;
  }

  void addTodo(String newTodoTitle){
    final todo = Todo(name: newTodoTitle);
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo) {
    todo.toggleDone();
    notifyListeners();
  }

  void deleteTodo(Todo todo){
    _todos.remove(todo);
    notifyListeners();
  }
}