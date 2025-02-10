import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/cubit/all_tasks_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/task_item.dart';

class TasksListView extends StatelessWidget {
  const TasksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllTasksCubit, AllTasksState>(
      builder: (context, state) {
        List<TaskModel> task = BlocProvider.of<AllTasksCubit>(context).tasks;
        return Expanded(
          child: ListView.builder(
            itemCount: task.length,
            itemBuilder: (context, index) {
              return TaskItem(
                taskModel: task[index],
              );
            },
          ),
        );
      },
    );
  }
}
