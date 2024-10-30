import 'package:flutter/material.dart';
import 'package:todo/Widgets/tasklistview.dart';
import 'package:todo/model/task.dart';
import 'package:todo/todoapp.dart';

class Addtaskbutton extends StatefulWidget {

  String task;


  Addtaskbutton(this.task, {super.key});

  @override
  State<Addtaskbutton> createState() => _AddtaskbuttonState(task);
}

class _AddtaskbuttonState extends State<Addtaskbutton> {
  String task ;

  _AddtaskbuttonState(this.task);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.pinkAccent) ,
        alignment: Alignment.center,
        shape:WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ))

        ),
        onPressed: ()=>{
        setState(() {
          task.isNotEmpty?Data.li.add(task):print(task="_____");
        })

        }

    , child: const Text("Add Task",style: TextStyle(fontSize: 13, color: Colors.white),));
    // return Material(
    //   color: Colors.pinkAccent.shade200,
    //   borderRadius: BorderRadius.circular(10),
    //   child: InkWell(
    //       onTap: () => {
    //             if (Data.temp != "")
    //               {Data.li.add(Data.temp), Data.temp = "", print(Data.li[0])},
    //             setState(() {
    //               const Todoapp();
    //             })
    //           },
    //       child: AnimatedContainer(
    //         height: 50,
    //         width: 200,
    //         duration: const Duration(
    //           seconds: 2,
    //         ),
    //         alignment: Alignment.center,
    //         child: const Text(
    //           "Add Task",
    //           style: TextStyle(fontSize: 15, color: Colors.white),
    //         ),
    //       )),
    // );
    // TODO: implement build
  }
}
