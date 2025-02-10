import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/cubits/cubit/all_tasks_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/simple_bloc_observer.dart';
import 'package:to_do_app/views/tasks_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.deleteFromDisk();
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kBoxName);
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllTasksCubit(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: TasksView(),
      ),
    );
  }
}
