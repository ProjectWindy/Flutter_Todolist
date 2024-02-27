import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page1/CounterPage.dart';
import 'package:flutter_application_1/Page1/FirstPage.dart';
import 'package:flutter_application_1/Page1/HomePage.dart';
import 'package:flutter_application_1/Page1/SeconPage.dart';
import 'package:flutter_application_1/Page1/SettingPage.dart';
import 'package:flutter_application_1/Page1/Todopage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}
 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(primarySwatch: Colors.yellow ),
    // home: Todopage(),
    // home: Counter(),
    // home: FirstPage(),
    routes: {
      '/FirstPage':(content)=> FirstPage(),
      '/SecondPage':(content)=> SeconPage(),
      '/SettingPage':(content)=>SettingPage(),
    },
    );
    
  }
}