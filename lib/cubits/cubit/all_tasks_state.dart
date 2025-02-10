part of 'all_tasks_cubit.dart';

@immutable
sealed class AllTasksState {}

final class AllTasksInitial extends AllTasksState {}
final class AllTasksSuccess extends AllTasksState {}
final class AllTasksFailuer extends AllTasksState {
  final String errMassage;

  AllTasksFailuer({required this.errMassage});
}
