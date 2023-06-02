import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          padding: const EdgeInsets.only(left: 20.0, top: 20.0),
          itemCount: taskData.taskCount, //guide for repeat creating a Tile
          itemBuilder: (context, index) {
            // Return the widget for the item at the given index
            final task = taskData.tasks[index];
            return TaskTile(
              taskName: task.name,
              isChecked: task.isDone,
              checkBoxCallBack: (checkboxState) {
                taskData.updateTask(task);
              },
              deleteTaskCallBack: () {
                taskData.deleteTask(task);
              },
            );
          },
        );
      },
    );
  }
}
