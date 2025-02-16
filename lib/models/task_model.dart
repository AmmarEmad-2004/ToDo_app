// import 'package:hive/hive.dart';

// part 'task_model.g.dart';

// @HiveType(typeId: 0)
// class TaskModel extends HiveObject{
//   @HiveField(0)
//    String title;
//   @HiveField(1)
//    String subTitle;

//   @HiveField(2)
//   bool checkMark;

//   TaskModel(
//      {
//     required this.title,
//     required this.subTitle,

//     this.checkMark = false,
//   });
// }
// task_model.dart
// task_model.dart
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle;

  @HiveField(2)
  bool checkMark; 

  TaskModel({
    required this.title,
    required this.subTitle,
    this.checkMark = false,
  });

  
}

