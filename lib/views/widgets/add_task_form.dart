
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/cubits/add_task_cubit/add_task_cubit.dart';
import 'package:to_do_app/models/task_model.dart';
import 'package:to_do_app/views/widgets/custom_app_bar.dart';
import 'package:to_do_app/views/widgets/custom_elevated_button.dart';
import 'package:to_do_app/views/widgets/custom_text_field.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm({super.key});

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  String? title, subTitle;
  final GlobalKey<FormState> _globalKey = GlobalKey();

  AutovalidateMode _autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _globalKey,
        autovalidateMode: _autovalidateMode,
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(text: 'Create new task'),
            Text('Schedule'),
            CustomTextFormField(
              onSaved: (value) {
                title = value;
              },
              hint: 'task name',
            ),
            Text(
              'Note :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            CustomTextFormField(
              onSaved: (value) {
                subTitle = value;
              },
              hint: 'Entre your task',
              maxline: 4,
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: BlocBuilder<AddTaskCubit, AddTaskState>(
                builder: (context, state) {
                  return CustomElevatedButton(
                    onPressed: () {
                      if (_globalKey.currentState!.validate()) {
                       
                        _globalKey.currentState!.save();
                        var task = TaskModel(
                          title: title!,
                          subTitle: subTitle!,
                          
                        );
                        BlocProvider.of<AddTaskCubit>(context).addTask(task);
                      } else {
                        _autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    text: 'Create Task',
                    size: 120,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
