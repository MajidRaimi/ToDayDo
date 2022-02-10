import 'package:flutter/material.dart';

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
            const Text(
              "Add Task",
              style: TextStyle(
                color: Colors.indigo,
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
                cursorColor: Colors.indigo,
                cursorHeight: 26,
                autofocus: true,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  fillColor: Colors.indigo,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 2),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.indigo, width: 1),
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
                    widget. addTaskCallBack(newTaskTitle); 
                  }

                  Navigator.pop(context);
                },
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 15,
                  color: Colors.indigo,
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
