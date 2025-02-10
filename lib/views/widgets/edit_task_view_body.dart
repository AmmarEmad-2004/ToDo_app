import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/constants.dart';
import 'package:to_do_app/cubits/cubit/all_tasks_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_app_bar.dart';
import 'package:to_do_app/views/widgets/custom_elevated_button.dart';
import 'package:to_do_app/views/widgets/custom_text_field.dart';

class EditTaskViewBody extends StatefulWidget {
  const EditTaskViewBody({
    super.key,
    required this.taskModel,
  });
  final TaskModel taskModel;

  @override
  State<EditTaskViewBody> createState() => _EditTaskViewBodyState();
}

class _EditTaskViewBodyState extends State<EditTaskViewBody> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: 'Edit task'),
            Text('Schedule'),
            CustomTextFormField(
              hint: widget.taskModel.title,
              onChanged: (value) {
                title = value;
              },
            ),
            Text(
              'Note :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            CustomTextFormField(
              hint: widget.taskModel.subTitle,
              maxline: 4,
              onChanged: (value) {
                subTitle = value;
              },
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: Row(
                spacing: 8,
                children: [
                  CustomElevatedButton(
                    onPressed: () {
                      widget.taskModel.title = title ?? widget.taskModel.title;
                      widget.taskModel.subTitle =
                          subTitle ?? widget.taskModel.subTitle;

                      widget.taskModel.save();
                      BlocProvider.of<AllTasksCubit>(context).fetchAllTasks();

                      Navigator.pop(context);
                    },
                    text: 'Edit Task',
                    size: 50,
                  ),
                  CustomElevatedButton(
                    onPressed: () {
                      widget.taskModel.delete();
                      Navigator.pop(context);
                    },
                    text: 'Delete Task',
                    size: 35,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
