import 'package:hive_flutter/hive_flutter.dart';

class Database {
  final _mybox=Hive.box("mybox");
  List todolist=[];

void createIntialData(){
  todolist=[
    ["code",false],
    ["Do Exercise",false],
    ];

}
void loadData(){
  todolist=_mybox.get("todolist");
}
void updateDatabase(){
  _mybox.put('todolist', todolist);
}

}