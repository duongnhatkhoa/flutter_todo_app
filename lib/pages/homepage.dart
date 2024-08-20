import 'package:flutter/material.dart';
import 'package:todo_app/util/dialog_box.dart';
import '../util/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Text controller
  final _controller = TextEditingController();
  //methods

  //List
  List toDoList = [
    ['Do some', false],
    ['Do some more', false],
  ];
  // Checkbox checked
  void checkBoxChanged(bool ?value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }
  // save a new task
  void saveNewTask(){
    setState(() {
      toDoList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    _controller.text = "";
  }

  // create a new task
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return DialogBox(
        controller: _controller,
        onSave: saveNewTask,
        onCancel: () => Navigator.of(context).pop(),
      );
    });
  }

  void deleteTask(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
      ),
      backgroundColor: Theme.of(context).canvasColor,

      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) =>
          TodoTile(
          taskName: toDoList[index][0],
          taskCompleted: toDoList[index][1],
          onChanged: (value) => checkBoxChanged(value, index),
          deleteFunction: deleteTask),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
