import 'package:flutter/material.dart';
import 'package:todo/Widgets/tasklistview.dart';
import 'package:todo/Widgets/taskview.dart';
import 'package:todo/todoapp.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        fontFamily:GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.pinkAccent.shade200,

        )
      ),
      initialRoute: "/todoapp",
    routes: {
      "/todoapp":(context)=>const Todoapp(),
      // "/taskview" :(context)=> TaskView("Null",0),
      // "/tasklistview" :(context)=>const TaskListView()

    },

    );
  }
}