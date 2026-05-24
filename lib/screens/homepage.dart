import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:task2/data/database.dart';
import 'package:task2/util/dialog_box.dart';
import 'package:task2/util/todo_tile.dart';
class Homepage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  
   const Homepage({super.key, required this.onThemeToggle});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final _mybox=Hive.box('mybox');

  final _controller=TextEditingController();

void savenewtask(){
  setState(() {
    db.todolist.add([_controller.text,false]);
    _controller.clear();
  });
  db.updateDatabase();
  Navigator.of(context).pop();
}

 void canceltask(){
  _controller.clear();
  Navigator.of(context).pop();

 }

 Database db=Database();
 @override
 void initState(){
  if(_mybox.get('todolist')==null){
    db.createIntialData();
  }
  else{
    db.loadData();
  }
  super.initState();
 }

  // List todolist=[
  //   ["Code",false],
  //   ["Study DSA",false]
  // ];
  void checkBoxChanged(bool? value,int index){
    setState(() {
      db.todolist[index][1]=!db.todolist[index][1];
    });
  }

  void addtask(){
    showDialog(context: context,
     builder: (context){
       return DialogBox(
        controller: _controller,
        onSave: savenewtask,
        oncancel: canceltask,
         heading: 'Add a new task',
       );
     });
  }
   void delete(int index){
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDatabase();
   }
   void saveEditedTask(int index) {
  setState(() {
    db.todolist[index][0] = _controller.text;
  });
  _controller.clear();
  db.updateDatabase();
  Navigator.of(context).pop();
}


  void edit(int index) {
  _controller.text = db.todolist[index][0];

  showDialog(
    context: context,
    builder: (context) {
      return DialogBox(
        heading: 'Edit task',
        controller: _controller,
        onSave: () => saveEditedTask(index),
        oncancel: canceltask,
      );
    },
  );
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
      floatingActionButton: FloatingActionButton(onPressed: addtask,
      child:Icon(Icons.add)),

      body:ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context,index){
          return TodoTile(
            iscompleted: db.todolist[index][1],
           onChanged:(value)=> checkBoxChanged(value,index),
            taskname: db.todolist[index][0],
            deletetask: (context) =>delete(index) ,
            edittask: (context)=>edit(index),);
            
        },
        
      ) ,
    );
    
  }
}