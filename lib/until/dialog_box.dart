import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_to_do_list/until/btn_dialog.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSubmite;
  VoidCallback onCencel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSubmite,
    required this.onCencel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blue,
      
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Add new task',
              ),
            ),

            // btn submite and cancel
            Row(
              children: [
                // btn submite
                BtnDialog(
                  text: 'SAVE', 
                  onPressed: onSubmite,
                  color: Colors.blueGrey,
                ),

                const SizedBox(width: 8),

                // btn cencel
                BtnDialog(
                  text: 'CENCEL', 
                  onPressed: onCencel,
                  color: Colors.red,
                ),
              ],

            )

        ]),
      ),
    
    );
  }
}