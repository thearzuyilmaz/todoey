class Task {
  String name;
  bool isDone;

  Task({required this.name, this.isDone = false});

  void changeBoolValue() {
    isDone = !isDone;
  }
}
