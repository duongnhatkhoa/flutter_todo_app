import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, required this.controller,required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 200,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            TextField(
              controller: controller,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.amber, // Set the border color to yellow
                    width: 1.0, // Adjust the width of the border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.amber, // Set the border color to yellow
                    width: 2.0, // Adjust the width of the border
                  ),
                ),
                hintText: "Add a new task",
                hintStyle: TextStyle(
                  color: Colors.grey,
                )
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyButton(text: 'Save',onPressed: onSave,),
                MyButton(text: 'Cancel',onPressed: onCancel,),
              ],
            )

          ],
        ),
      ),
    );
  }
}
