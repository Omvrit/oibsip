// import 'package:flutter/material.dart';
// import 'package:todo/Widgets/deletebutton.dart';
// import 'package:todo/model/task.dart';
//
// class TaskView extends StatelessWidget {
//   String task;
//   int index;
//
//   TaskView(this.task,this.index, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
//       child: Column(
//
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 280,
//
//
//
//                 alignment: Alignment.centerLeft,
//
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(task,style: const TextStyle(
//                     fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black
//
//                   ),),
//                 ),
//               ),
//               const SizedBox(width: 4,),
//               Container(alignment: Alignment.bottomRight,child:
//               Material(
//
//                 color: Colors.redAccent.shade200,
//                 borderRadius: BorderRadius.circular(10),
//
//                 child: InkWell(
//                     onTap: ()=>{
//                       setState(() {
//                         Data.li.removeAt(index);
//                       })
//
//                     },
//
//                     child: AnimatedContainer(
//                       height: 30,
//                       width: 60,
//                       duration: const Duration(seconds: 2,),
//                       alignment: Alignment.center,
//                       child: const Text("Del",style: TextStyle(fontSize: 10,color: Colors.white),),
//
//
//
//                     )
//                 ),
//               ),)
//             ],
//           ),
//           const SizedBox(height: 10)
//         ],
//       ),
//     )
//     ;
//
//     throw UnimplementedError();
//   }
// }
