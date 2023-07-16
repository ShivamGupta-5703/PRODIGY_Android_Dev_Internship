class Task {
  late final String text;
  late bool isDone;
  Task({required this.text, this.isDone = false});

  void toggleDone() {
    isDone = !isDone;
  }
}
