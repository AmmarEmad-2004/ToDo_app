import 'package:flutter/material.dart';
import 'package:to_do_app/models/task_model.dart';

import 'package:to_do_app/views/edit_task_view.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return EditTaskView(taskModel: widget.taskModel);
            }),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
              side: BorderSide(
                  color: const Color.fromARGB(255, 71, 71, 71), width: 0.5)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 68, 76, 76).withValues(alpha: 0.7),
                      Color.fromARGB(255, 24, 24, 24).withValues(alpha: 0.3),
                    ])),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(clipBehavior: Clip.none, children: [
                        Text(
                          widget.taskModel.title,
                          style: TextStyle(
                              decoration: widget.taskModel.checkMark
                                  ? TextDecoration.lineThrough
                                  : TextDecoration.none,
                              color: widget.taskModel.checkMark
                                  ? Colors.grey
                                  : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        Positioned(
                            bottom: -4,
                            child: Container(
                              height: 2,
                              width: 220,
                              color: Colors.white,
                            ))
                      ]),
                      Checkbox(
                        side: BorderSide(color: Colors.white),
                        // activeColor: Color.fromARGB(255, 137, 58, 58),
                        value: widget.taskModel.checkMark,
                        onChanged: (newValue) {
                          widget.taskModel.checkMark =
                              newValue ?? widget.taskModel.checkMark;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Note : ',
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    ' ${widget.taskModel.subTitle}',
                    style: TextStyle(
                      decoration: widget.taskModel.checkMark
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      color: widget.taskModel.checkMark
                          ? Colors.grey
                          : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
