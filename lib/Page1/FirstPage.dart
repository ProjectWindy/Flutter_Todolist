 // ignore_for_file: prefer_const_constructors

 import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page1/HomePage.dart';
import 'package:flutter_application_1/Page1/Profilepage.dart';
import 'package:flutter_application_1/Page1/SeconPage.dart';
import 'package:flutter_application_1/Page1/SettingPage.dart';

class FirstPage extends StatefulWidget {
    FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
void _navigatorBottomBar(int index){
  setState((
   ) {
        _selectIndex = index;

  });
}

int _selectIndex=0;

final List _pages =[
  // Homepage
  HomePage(),
  // Profile Page
  Profilepage(),
  // SettingPAge()
  SettingPage(),
];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('FirstPage'),),
      body: _pages[_selectIndex],
      // Thanh truot ben phai
    drawer:Drawer(
      backgroundColor: Colors.deepPurple[100],
      child:Column
      // ignore: prefer_const_literals_to_create_immutables
      (children: [
        DrawerHeader(
          child: Icon(Icons.favorite,size: 58,),
          ),
          // home page list title
          ListTile(leading: Icon(Icons.home),title: Text('H O M E '),onTap: (){
            // thoat 
            Navigator.pop(context);
            Navigator.pushNamed(context,'/SettingPage'); 
          },),
           ListTile(leading: Icon(Icons.settings),title: Text('S E T T I N G S '),onTap: (){
                        Navigator.pushNamed(context,'/SettingPage'); 

           },)
      ],
      ),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      bottomNavigationBar: BottomNavigationBar(
        // Xac' dinh cac icon trang dang duoc click vao
        currentIndex: _selectIndex,
        onTap:_navigatorBottomBar,
        items: [
         
        // home
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME",),
        // profile
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile",),

        // settings
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Settings",),

      ],),
    
    );
   
}
}