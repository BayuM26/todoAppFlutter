import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_do_list/data/database.dart';
import 'package:flutter_to_do_list/until/dialog_box.dart';
import 'package:flutter_to_do_list/until/todo_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();

  // inisialisasi database 
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // load data yang ada di local storage
    db.loadData();

    super.initState();
  }

  // chackbox 
  void checkBoxChanged(bool? value, int index) 
  {
    setState(() {
      db.itemToDo[index][1] = !db.itemToDo[index][1];
    });
    db.updateData();
  }

  // save task ke local storage
  void saveNewTask(){
    setState(() {
      // menambah data ke liat array di atas
      db.itemToDo.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  // show modal
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context){
        return DialogBox(
          controller: _controller,
          onSubmite: saveNewTask,
          onCencel: () => Navigator.of(context).pop(),
        );
      }
    );
  }

  // hapus task
  void deleteTask(int index){
    setState(() {
      db.itemToDo.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      
      appBar: AppBar(
        title: const Text(
          'TO DO',
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),

      body: ListView.builder(
        itemCount: db.itemToDo.length,

        itemBuilder: (context, index) {
        
          return ToDoTitle(
            
            taskName: db.itemToDo[index][0],
            taskComplated: db.itemToDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          
          );
        
        },

      ),

    );
  }
}
