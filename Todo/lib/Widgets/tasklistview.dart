// import 'package:flutter/material.dart';
// import 'package:todo/Widgets/taskview.dart';
//
// import '../model/task.dart';
//
// class TaskListView extends StatefulWidget {
//   const TaskListView({super.key});
//
//   @override
//   State<TaskListView> createState()  => _TaskListViewState();
// }
//
// class _TaskListViewState extends State<TaskListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 230,
//       width: 380,
//       decoration: const BoxDecoration(
//
//       ),
//       child: ListView.builder(
//           itemBuilder: (context, index) {
//             var show = Data.li[index];
//             return TaskView(show,1);//fix it
//           },
//           itemCount: Data.li.length),
//     );
//
//     throw UnimplementedError();
//   }
// }
