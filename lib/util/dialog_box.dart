import 'package:flutter/material.dart';
import 'package:task2/util/my_buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback oncancel;
  
   DialogBox({super.key,
   required this.controller,
  required this.onSave,
  required this.oncancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor:Theme.of(context).colorScheme.onPrimary,
      content: Container(
        height: 120,
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(text: "Save", onPressed: onSave),
                SizedBox(width: 8,),
                MyButtons(text: 'cancel', onPressed: oncancel)

              ],
            )
            
          ],
        ),
      ),
    );
  }
}