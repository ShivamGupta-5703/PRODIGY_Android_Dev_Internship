import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool? isChecked;
  late final String taskText;
  final Function(bool?) checkBoxCallBack;
  final GestureLongPressCallback? longPressCallback;

  TaskTile(
      {required this.taskText,
      required this.isChecked,
      required this.checkBoxCallBack,
      required this.longPressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onLongPress: longPressCallback,
        title: Text(
          taskText,
          style: TextStyle(
              decoration: isChecked! ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: isChecked,
          onChanged: checkBoxCallBack,
          activeColor: Colors.lightBlueAccent,
        ));
  }
}
