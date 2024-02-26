import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List itemToDo = [];

  final _myBox = Hive.box('MyBox');

  // jika user baru pertama kali menggunakan aplikasi maka data yang kan di tampilkan di bawah ini
  void createInitialData(){
    itemToDo = [
      ['ini tes 1', false],
      ['ini tes 2', false],
      ['ini tes 3', false],
      ['ini tes 4', false],
      ['ini tes 5', false],
    ];
  }

  void loadData(){
    itemToDo = _myBox.get('table');
  }

  void updateData(){
    _myBox.put('table', itemToDo);
  }
}