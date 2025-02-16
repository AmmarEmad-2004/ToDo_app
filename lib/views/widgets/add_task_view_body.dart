import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:to_do_app/cubits/all_task_cubit/all_tasks_cubit.dart';
import 'package:to_do_app/views/widgets/add_task_form.dart';

class AddTaskViewBody extends StatelessWidget {
  const AddTaskViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddTaskCubit, AddTaskState>(
      listener: (context, state) {
        if (state is AddTaskFailuer) {
        } else if (state is AddTaskSuccess) {
          BlocProvider.of<AllTasksCubit>(context).fetchAllTasks();
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: kPrimaryColor,
          body: AddTaskForm(),
        );
      },
    );
  }
}
