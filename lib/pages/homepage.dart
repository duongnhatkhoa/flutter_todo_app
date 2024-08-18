import 'package:flutter/material.dart';
import '../util/todo_tile.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  void createNewTask(){
    showDialog(context: context, builder: (context) {
      return AlertDialog();
    });
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
          onChanged: (value) => checkBoxChanged(value, index))
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
    );
  }
}
