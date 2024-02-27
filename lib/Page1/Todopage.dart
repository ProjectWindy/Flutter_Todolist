 import 'package:flutter/material.dart';

class Todopage extends StatefulWidget {
  const Todopage({super.key});

  @override
  State<Todopage> createState() => _TodopageState();
}

class _TodopageState extends State<Todopage> {
  // Text Edit dieu khien nhung gi nguoi dung nhap
  TextEditingController myController = TextEditingController();
  // GreetingMessage variable
  String GreetMessage = '';
  // Greet User method
  void greetUser(){
   setState(() {
    String userName = myController.text;
     GreetMessage = "Hello, " + userName;
   });
  }
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(GreetMessage),
            // Text field
            TextField(controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Type you Name"
              ),

            ),
            // Button
            ElevatedButton(onPressed: greetUser, child: Text("Tap"),),
          ],
        ),
      ),),

    );
  }
}