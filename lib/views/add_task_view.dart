import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:to_do_app/views/widgets/add_task_view_body.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTaskCubit(),
      child: AddTaskViewBody(),
    );
  }
}
