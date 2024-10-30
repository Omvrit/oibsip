// import 'package:flutter/material.dart';
// import 'package:todo/todoapp.dart';
//
// import '../model/task.dart';
// class DeleteButton extends StatefulWidget{
//   int Index;
//
//
//   DeleteButton(this.Index, {super.key});
//
//   @override
//   State<DeleteButton> createState() => _DeleteButtonState(Index);
// }
//
// class _DeleteButtonState extends State<DeleteButton> {
//   int Index;
//
//
//   _DeleteButtonState(this.Index);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Material(
//
//       color: Colors.redAccent.shade200,
//       borderRadius: BorderRadius.circular(10),
//
//       child: InkWell(
//           onTap: ()=>{
//             setState(() {
//                 Data.li.removeAt(Index);
//             })
//
//           },
//
//           child: AnimatedContainer(
//             height: 30,
//             width: 60,
//             duration: const Duration(seconds: 2,),
//             alignment: Alignment.center,
//             child: const Text("Del",style: TextStyle(fontSize: 10,color: Colors.white),),
//
//
//
//           )
//       ),
//     );
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }