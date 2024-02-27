// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Page1/util/Button.dart';

class Dialogbox extends StatelessWidget {
  final controller;
  VoidCallback onsave;
  VoidCallback onCancel;

    Dialogbox({
    Key? key,
    required this.controller,
    required this.onsave,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(height: 120,
      child: Column(children: [
        // get user input
        TextField(
          controller: controller,
          decoration: InputDecoration(border: OutlineInputBorder(),
          hintText: "add a new Task"),
          
        ),
        Row(
        mainAxisAlignment:MainAxisAlignment.end,
          children: [
          MyButton(text: "save", onPressed: (){onsave();}),
               const SizedBox(width: 4,),
         MyButton(text: "Cancel", onPressed: (){onCancel();}),


        ],)
      ],),),
    );
  }
}
