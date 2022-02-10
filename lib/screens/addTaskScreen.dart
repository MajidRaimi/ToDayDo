import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/data/taskData.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTaskCallBack;

  AddTaskScreen(this.addTaskCallBack);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String newTaskTitle = "";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              "Add Task",
              style: TextStyle(
                color: Provider.of<TaskData>(context).mainColor,
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                onChanged: (value) {
                  newTaskTitle = value;
                },
                cursorColor: Provider.of<TaskData>(context).mainColor,
                cursorHeight: 26,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  fillColor: Provider.of<TaskData>(context).mainColor,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Provider.of<TaskData>(context).mainColor!,
                        width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: Provider.of<TaskData>(context).mainColor!,
                        width: 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 65,
                right: 65,
                top: 40,
                bottom: 5,
              ),
              child: GestureDetector(
                onTap: () {
                  if (newTaskTitle.length > 0) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(newTaskTitle);
                  }

                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 15,
                  color: Provider.of<TaskData>(context).mainColor,
                  child: const Center(
                    child: Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
