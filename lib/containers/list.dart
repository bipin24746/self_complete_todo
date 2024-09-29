import 'package:flutter/material.dart';
import 'package:todo_app/assets/colors.dart';
import 'package:todo_app/pages/mainpage.dart';

class TodoList extends StatefulWidget {
  final String text;
  const TodoList({super.key, required this.text});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  bool todelete = true;

  @override
  Widget build(BuildContext context) {
    void deletebutton() {
      setState(() {
        todelete = false;
      });
    }

    return Container(
      child: Column(
        children: [
          if (todelete)
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                height: 65,
                width: 400,
                child: DecoratedBox(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.text,
                              textAlign: TextAlign.left,
                            ),
                            IconButton(
                                onPressed: () {
                                  deletebutton();
                                },
                                icon: Icon(Icons.delete))
                          ],
                        ),
                      )
                    ],
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}
