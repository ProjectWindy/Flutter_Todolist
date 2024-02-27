import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  // variable
  int _counter = 0;
  // Method
  void _IncrementCounter (){
    setState(() {
      // Xay dung lai tien ich thay doi
       _counter ++;
    });
    
  }
  // UI
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text("you pushed the button this many time"),

          Text(_counter.toString(),style: TextStyle(fontSize: 48),),
          // Button
          ElevatedButton(onPressed: _IncrementCounter, child: Text("Increment"),),

        ],
        ),
      ),
    );
  }
}