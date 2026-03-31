import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String taskname;
  final bool iscompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deletetask;
   Function(BuildContext)? edittask;

   TodoTile({super.key,
  required this.iscompleted,
  required this.onChanged,
  required this.taskname,
  required this.deletetask,
  required this.edittask,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(),
         children: [
          SlidableAction(
          onPressed: deletetask,
          icon: Icons.delete,
          backgroundColor: Colors.red,
          borderRadius: BorderRadius.circular(8),),
           SlidableAction(
          onPressed: edittask,
          icon: Icons.edit,
          backgroundColor: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(8),),
          ]
         ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Checkbox(value: iscompleted, onChanged: onChanged),
                Text(taskname,
                style: TextStyle(
                  fontSize: 20,
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
      ),
    );
  }
}