import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  // list data todo
  List itemToDo = [
    ['ini tes 1', false],
    ['ini tes 2', false],
    ['ini tes 3', false],
    ['ini tes 4', false],
    ['ini tes 5', false],
  ];

  void checkBoxChanged(bool? value, int index) 
  {
    setState(() {
      itemToDo[index][1] = !itemToDo[index][1];
    });
  }

  void saveNewTask(){
    setState(() {
      // menambah data ke liat array di atas
      itemToDo.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

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

  void deleteTask(int index){
    setState(() {
      itemToDo.removeAt(index);
    });
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
        itemCount: itemToDo.length,

        itemBuilder: (context, index) {
        
          return ToDoTitle(
            
            taskName: itemToDo[index][0],
            taskComplated: itemToDo[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          
          );
        
        },

      ),

    );
  }
}
