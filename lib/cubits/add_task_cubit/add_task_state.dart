part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

final class AddTaskLoading extends AddTaskState {}

final class AddTaskSuccess extends AddTaskState {}

final class AddTaskFailuer extends AddTaskState {
  final String errMassage;

  AddTaskFailuer({required this.errMassage});
  
}
