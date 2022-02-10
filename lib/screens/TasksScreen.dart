import 'package:flutter/material.dart';
import 'package:tododay/data/taskData.dart';
import '/models/task.dart';
import '../widgets/tasksList.dart';
import 'addTaskScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class TasksScreen extends StatefulWidget {
  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  late Color mainColor;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    mainColor = Provider.of<TaskData>(context).mainColor!;
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
                // setState(() {
                //   tasks.add(Task(name: newTaskTitle));
                // });
              }),
            )),
          );
        },
        backgroundColor: Provider.of<TaskData>(context).mainColor,
        child: Icon(Icons.add),
      ),
      backgroundColor: Provider.of<TaskData>(context).mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
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
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.camera_sharp, color: Colors.white),
                    iconSize: 28,
                    onPressed: () {
                      testAlert(context);
                    },
                  )
                ],
              ),
              Text(
                "${Provider.of<TaskData>(context).tasks.length} ${(Provider.of<TaskData>(context).tasks.length == 1) ? "Task" : "Tasks"}\n",
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
                    child: TasksList(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // Widget buildColorPicker() => ColorPicker(
  void testAlert(BuildContext context) {
    var alert = AlertDialog(
        title: Text("Pick A Color" , style : TextStyle(color : mainColor , fontSize : 24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildColorPicker(context),
            TextButton(
              child: Text(
                "Change",
                style: TextStyle(
                  color: mainColor , 
                  fontSize : 20
                ),
              ),
              onPressed: () {
                setState(() {
                  Provider.of<TaskData>(context, listen: false)
                      .changeColor(mainColor);
                });
                Navigator.pop(context);
              },
            ),
          ],
        ));

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  Widget buildColorPicker(BuildContext context) => ColorPicker(
        pickerColor: mainColor,
        onColorChanged: (color) => mainColor = color,
        enableAlpha: false,
        showLabel: false,
      );
}
