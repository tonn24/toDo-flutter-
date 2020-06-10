import 'package:flutter/material.dart';
import 'screens/todos_screen.dart';
import 'package:provider/provider.dart';
import 'models/todo_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoData(),
      child: MaterialApp(
        home: TodoScreen()
      ),
    );
  }
}


