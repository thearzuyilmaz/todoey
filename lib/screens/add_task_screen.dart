import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:todo_flutter/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle = ''; //put after the build method ?

    return Container(
      decoration: BoxDecoration(
        color: Colors.deepOrangeAccent,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text('Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30.0)),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center, //keyboard comes automatically
              onChanged: (userText) {
                newTaskTitle = userText; //saving user data
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                ),
                onPressed: () {
                  context
                      .read<TaskData>()
                      .addTask(newTaskTitle); //watch does not work. use read.
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(color: Colors.deepOrange, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
