import 'package:flutter/material.dart';
import 'data/taskData.dart';
import 'screens/TasksScreen.dart';
import 'package:provider/provider.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create : (context) => TaskData() ,
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.indigo,
        ),
        home: TasksScreen(),
      ),
    );
  }
}
