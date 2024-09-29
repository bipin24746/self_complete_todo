import 'package:flutter/material.dart';
import 'package:todo_app/assets/colors.dart';
import 'package:todo_app/containers/addlist.dart';
import 'package:todo_app/containers/list.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  TextEditingController addtextform = TextEditingController();
  List<String> todoItems = []; // List to store todo items

  void addtext() {
    setState(() {
      if (addtextform.text.isNotEmpty) {
        todoItems.add(addtextform.text);
        addtextform.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "TodoList App",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: white),
        ),
        backgroundColor: blue,
      ),
      body: Column(children: [
        Expanded(
            child: ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (context, index) {
                  return TodoList(text: todoItems[index]);
                })),
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  controller: addtextform,
                                  decoration: InputDecoration(
                                      hintText: "Enter Your Text",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                    onPressed: () {
                      addtext();
                    },
                    icon: Icon(Icons.send))
              ],
            ),
          ],
        )
      ]),
    );
  }
}
