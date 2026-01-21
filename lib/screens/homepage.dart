import 'package:flutter/material.dart';
import 'package:task2/util/todo_tile.dart';
class Homepage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const Homepage({super.key,required this.onThemeToggle});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todolist=[
    ["Code",false],
    ["Study DSA",false]
  ];
  void checkBoxChanged(bool? value,int index){
    setState(() {
      todolist[index][1]=!todolist[index][1];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        elevation: 6,
        title: Text('To Do'),
        actions: [
          IconButton(onPressed: widget.onThemeToggle, icon: Icon(Icons.brightness_6),)
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      ),
      body:ListView.builder(
        itemCount: todolist.length,
        itemBuilder: (context,index){
          return TodoTile(
            iscompleted: todolist[index][1],
           onChanged:(value)=> checkBoxChanged(value,index),
            taskname: todolist[index][0]);
        },
        
      ) ,
    );
    
  }
}