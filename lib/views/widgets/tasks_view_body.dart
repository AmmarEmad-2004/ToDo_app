import 'package:flutter/material.dart';

import 'package:to_do_app/constants.dart';

import 'package:to_do_app/views/add_task_view.dart';

import 'package:to_do_app/views/widgets/tasks_view_body_details.dart';

class TasksViewBody extends StatelessWidget {
  const TasksViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: CircleBorder(),
        backgroundColor: Color(0xffD9D9D9),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTaskView();
          }));
        },
        child: Icon(
          Icons.add,
          size: 40,
          color: Colors.black,
        ),
      ),
      backgroundColor: kPrimaryColor,
      body: TasksViewBodyDetails(),
    );
  }
}
