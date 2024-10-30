import 'package:flutter/material.dart';
import 'Widgets/taskview.dart';
import 'model/task.dart';

class Todoapp extends StatefulWidget {
  const Todoapp({super.key});

  @override
  State<Todoapp> createState() => _TodoappState();
}

class _TodoappState extends State<Todoapp> {
  String value = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "To Do App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.white70,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextFormField(
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter the task you will never do",
                label: Text(
                  "Enter Task",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              onChanged: (input) {
                setState(() {
                  value = input;
                  print(value);
                });
              },
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.pinkAccent),
              alignment: Alignment.center,
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
            onPressed: () {
              setState(() {
                if (value.isNotEmpty) {
                  Data.li.add(value); // Add task to the list
                } else {
                  print("${value}_____");
                }
              });
            },
            child: const Text(
              "Add Task",
              style: TextStyle(fontSize: 13, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              height: .5,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Tasks",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Expanded(  // Automatically expands based on available space
            child: ListView.builder(
              itemBuilder: (context, index) {
                var show = Data.li[index];
                return Card(
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Container(
                            width: 280,



                            alignment: Alignment.centerLeft,

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(show,style: const TextStyle(
                                  fontSize: 20,fontWeight: FontWeight.w500,color: Colors.black

                              ),),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          Container(alignment: Alignment.bottomRight,child:
                          Material(

                            color: Colors.redAccent.shade200,
                            borderRadius: BorderRadius.circular(10),

                            child: InkWell(
                                onTap: ()=>{
                                  setState(() {
                                    Data.li.removeAt(index);
                                  })

                                },

                                child: AnimatedContainer(
                                  height: 30,
                                  width: 60,
                                  duration: const Duration(seconds: 2,),
                                  alignment: Alignment.center,
                                  child: const Text("Del",style: TextStyle(fontSize: 10,color: Colors.white),),



                                )
                            ),
                          ),)
                        ],
                      ),
                      const SizedBox(height: 2)
                    ],
                  ),
                );
              },
              itemCount: Data.li.length,
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.pinkAccent,
      ),
    );
  }
}
