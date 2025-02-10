import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/task_model.dart';

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());

  addTask(TaskModel task) async {
    try {
      emit(AddTaskLoading());
      var tasksBox = Hive.box<TaskModel>(kBoxName);
      await tasksBox.add(task);
      emit(AddTaskSuccess());
    } catch (e) {
      emit(AddTaskFailuer(errMassage: e.toString()));
    }
  }
}
