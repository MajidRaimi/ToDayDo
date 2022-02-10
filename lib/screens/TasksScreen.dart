// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '/models/task.dart';
import '/widgets/TasksList.dart';
import 'addTaskScreen.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: "Go Shopping"),
    
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: AddTaskScreen((newTaskTitle) {
                setState(() {
                  tasks.add(Task(name: newTaskTitle));
                });
              }),
            )),
          );
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add),
      ),
      backgroundColor: Colors.indigo[400],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.playlist_add_check,
                    size: 46,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: width / 40,
                  ),
                  Text(
                    "ToDayDo",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Text(
                "${tasks.length} ${(tasks.length == 1) ? "Task" : "Tasks"}\n",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: (height / 26),
                  ),
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TasksList(tasks),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
