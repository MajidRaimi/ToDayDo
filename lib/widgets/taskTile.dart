import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkBoxChange;
  final Function listTileDelete; 
  TaskTile({
    required this.isChecked,
    required this.taskTitle,
    required this.checkBoxChange,
    required this.listTileDelete , 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        onLongPress: () {
          listTileDelete() ; 
        },
        title: Text(
          taskTitle,
          style: TextStyle(
            decoration: (isChecked) ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Checkbox(
          activeColor: Colors.indigo[400],
          value: isChecked,
          // onChanged: changeCheckBox,
          onChanged: checkBoxChange,
        ),
      ),
    );
  }
}
