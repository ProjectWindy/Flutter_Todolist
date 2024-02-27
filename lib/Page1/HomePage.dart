import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/database.dart';
import 'package:hive/hive.dart';
import './util/todo_tile.dart';
import './util/dialog.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});
  @override
  
State <HomePage> createState()=>_HomePageState();
}
class _HomePageState extends State<HomePage>{
  final _mybox = Hive.box('mybox');
   final _controller =TextEditingController();
ToDoDaTaBase db = ToDoDaTaBase();
@override
  void initState() {
    // if this is the 1st time ever open app, then create default data
    if(_mybox.get('TODOLIST')==null){
      db.createIntialData();
    }
      else{
        db.loadData();
      
    }
     super.initState();
  }
  
 void checkboxChange(bool? value , int index){
  setState(() { 
db.toDoList[index][1]= !db.toDoList[index][1];
  });db.UpdateData();
 }
   void saveNewTask() {
  setState(() {
    final newTaskText = _controller.text;
    if (_controller.text.isNotEmpty&!db.toDoList.any((task) => task[0] == newTaskText)) {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    }
    else {
    final snackBar = SnackBar(
          content: Text('Task already exists.'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }db.UpdateData();
  });
  Navigator.of(context).pop();
}
  void deleteTask(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });db.UpdateData();
  }
  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context){
      return Dialogbox(
        controller: _controller,
        onsave: saveNewTask,
        onCancel: ()=> Navigator.of(context).pop(),
        
      );
    },
    );db.UpdateData();
  }
 

 
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       backgroundColor: Colors.yellow[200],
       appBar: AppBar(
        title: Text('To do'),
        centerTitle: true,
        elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(onPressed:  createNewTask,child: Icon(Icons.add),),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context,index){ 
            return ToDoTile(
              taskName: db.toDoList[index][0], 
              taskCompleted: db.toDoList[index][1],
              onchanged: (value) => checkboxChange(value,index),
          deleteFunction: (context)=> deleteTask(index));
          },
              ),
    );
  }
  

}
