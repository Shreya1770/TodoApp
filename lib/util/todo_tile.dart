import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool iscompleted;
  Function(bool?)? onChanged;

   TodoTile({super.key,
  required this.iscompleted,
  required this.onChanged,
  required this.taskname,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            children: [
              Checkbox(value: iscompleted, onChanged: onChanged),
              Text(taskname,
              style: TextStyle(
                decoration: iscompleted
                ?TextDecoration.lineThrough
                :TextDecoration.none,
              ),),
            ],
            
          ),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(12)
        ),
      ),
    );
  }
}