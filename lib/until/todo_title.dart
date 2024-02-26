import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// ignore: must_be_immutable
class ToDoTitle extends StatelessWidget {
  final String taskName;
  final bool taskComplated;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTitle({
    super.key,
    required this.taskName,
    required this.taskComplated,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
            )
          ],
        ),

        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskComplated,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
        
              // task name
              Text(
                taskName,
                style: TextStyle(
                    decoration: taskComplated
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
