
class Todo {
  final String name;
  bool isDone;

  Todo({this.name, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}