import 'package:flutter/material.dart';
import 'package:todo_flutter/widgets/task_list.dart';
import 'package:todo_flutter/screens/add_task_screen.dart';
import 'package:todo_flutter/models/task.dart';
import 'package:todo_flutter/models/task_data.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => AddTaskScreen(),
            );
          },
          backgroundColor: Colors.deepOrangeAccent,
          child: Icon(Icons.add)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                    child: Icon(Icons.menu_rounded,
                        size: 40.0, color: Colors.deepOrangeAccent),
                    backgroundColor: Colors.white,
                    radius: 30.0),
                SizedBox(height: 15.0),
                Text('todoey',
                    style: TextStyle(
                        fontSize: 35.0,
                        letterSpacing: 3.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700)),
                Text(
                  '${context.watch<TaskData>().tasks.length} tasks', // { } kullanıyoruz ve $ dışarıda
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                ),
                child: TaskList(), //returns ListView sending the tasks data
              ),
            ),
          ),
        ],
      ),
    );
  }
}
