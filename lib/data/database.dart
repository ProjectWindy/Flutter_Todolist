import 'package:hive/hive.dart';

class ToDoDaTaBase{
      List toDoList =[];
  final _mybox = Hive.box('mybox');
// Du lieu mac dinh khi ng dung mo app lan dau
void createIntialData(){
     toDoList =[
      ["make Tutorial",false],
      ["Do exercise",false],
    ];
}
  //load the data from database  
  void loadData(){
toDoList = _mybox.get("TODOLIST");
  }
  void UpdateData(){
_mybox.put('TODOLIST', toDoList);
  }
}