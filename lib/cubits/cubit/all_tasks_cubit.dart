import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/models/task_model.dart';

part 'all_tasks_state.dart';

class AllTasksCubit extends Cubit<AllTasksState> {
  AllTasksCubit() : super(AllTasksInitial());

  List<TaskModel> tasks = [];
  fetchAllTasks() {
    try {
      var tasksBox = Hive.box<TaskModel>(kBoxName);
      tasks = tasksBox.values.toList();
      emit(AllTasksSuccess());
    } catch (e) {
      emit(AllTasksFailuer(errMassage: e.toString()));
    }
  }
}
