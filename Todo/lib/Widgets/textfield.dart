// import 'package:flutter/material.dart';
// import 'package:todo/Widgets/tasklistview.dart';
// import 'package:todo/model/task.dart';
// import 'package:todo/todoapp.dart';
//
// class ToDoTextField extends StatefulWidget{
//   const ToDoTextField({super.key});
//
//   @override
//   State<ToDoTextField> createState() => _ToDoTextFieldState();
// }
//
// class _ToDoTextFieldState extends State<ToDoTextField> {
//   @override
//   Widget build(BuildContext context) {
//     String task ;
//     return TextFormField(
//       textAlign: TextAlign.start,
//       decoration: const InputDecoration(
//           border: OutlineInputBorder(),
//           hintText: "Enter the task.dart you will never do ",
//           label: Text("Enter Task",style: TextStyle(fontWeight: FontWeight.w500),)
//       ),
//
//
//       onChanged: (value)=>{
//         Data.temp = (value),
//         setState(() {
//           const Todoapp();
//         })
//       },
//
//     );
//
//
//     throw UnimplementedError();
//   }
// }