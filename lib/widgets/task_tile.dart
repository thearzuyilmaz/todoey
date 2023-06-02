import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskName;
  final void Function(bool?) checkBoxCallBack;
  final void Function() deleteTaskCallBack;

  TaskTile(
      {required this.taskName,
      required this.isChecked,
      required this.checkBoxCallBack,
      required this.deleteTaskCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: deleteTaskCallBack,
      //leading: Icon(Icons.circle, color: Colors.deepOrangeAccent),
      title: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.deepOrangeAccent,
        onChanged: checkBoxCallBack,
      ),
    );
  }
}
