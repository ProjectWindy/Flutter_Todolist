// ignore_for_file: public_member_api_docs, sort_constructors_first, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onchanged;
  Function (BuildContext)? deleteFunction;

   ToDoTile({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.deleteFunction,

    this.onchanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(left:25.0,right: 25.0,top:25.0),
      child: Slidable(
        endActionPane: ActionPane( motion:StretchMotion(),children: [SlidableAction(onPressed:deleteFunction,icon:Icons.delete,backgroundColor: Colors.red.shade300,borderRadius: BorderRadius.circular(12),),

        ]),
        child: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(25),
           child:Row(
             children: [
              //checkbox
              Checkbox(value: taskCompleted, onChanged: onchanged,activeColor: Colors.black,),
               
              //Task name
               Text(taskName,style: TextStyle(decoration:taskCompleted ? TextDecoration.lineThrough:TextDecoration.none),),
             ],
           ),
          decoration:BoxDecoration(color: Colors.yellow,borderRadius:BorderRadius.circular(12),),
           
          
        ),
      ),
    );
  }
}
