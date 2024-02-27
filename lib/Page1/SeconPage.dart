import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page1/FirstPage.dart';

class SeconPage extends StatelessWidget {
  const SeconPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('SecondPage'),),
      body: Center(
        child:ElevatedButton(child:
        Text("Go To First Page"),
    onPressed: (){
          Navigator.push(context,
    MaterialPageRoute(builder: (context)=>FirstPage(),
    ),
    );
    },
    ),
    ),
    );
}
}