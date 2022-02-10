import 'package:flutter/material.dart';
import '/models/task.dart';
import '/widgets/taskTile.dart';

class TasksList extends StatefulWidget {
  late List<Task> tasks = [];

  TasksList(this.tasks);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.tasks.length,
      itemBuilder: (context, index) {
        return TaskTile(
          taskTitle: widget.tasks[index].name,
          isChecked: widget.tasks[index].isDone,
          checkBoxChange: (newValue) {
            setState(
              () {
                widget.tasks[index].changeIsDone();
              },
            );
          },
        );
      },
    );
    // ListView(
    //   children: [
    //     TaskTile(
    //       taskTitle: tasks[0].name,
    //       isChecked: tasks[0].isDone,
    //     ),
    //     TaskTile(
    //       taskTitle: tasks[1].name,
    //       isChecked: tasks[1].isDone,
    //     ),
    //   ],
    // );
  }
}
