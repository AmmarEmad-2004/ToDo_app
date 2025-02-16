import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/cubits/all_task_cubit/all_tasks_cubit.dart';
import 'package:to_do_app/views/widgets/custom_app_bar.dart';
import 'package:to_do_app/views/widgets/task_list_view.dart';

class TasksViewBodyDetails extends StatefulWidget {
  const TasksViewBodyDetails({
    super.key,
  });

  @override
  State<TasksViewBodyDetails> createState() => _TasksViewBodyDetailsState();
}

class _TasksViewBodyDetailsState extends State<TasksViewBodyDetails> {
  @override
  void initState() {
    BlocProvider.of<AllTasksCubit>(context).fetchAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var currentDateTime = DateTime.now();
    var dateTime = DateFormat('EEE.d MMM').format(currentDateTime);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomAppBar(
          text: dateTime,
          // 'Wed.24 APRIL'
        ),
        Text(
          'Welcome Back, SIR!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        Text(
          'Start scheduling your daily tasks.',
          style: TextStyle(fontSize: 18),
        ),
        TasksListView()
      ],
    );
  }
}
