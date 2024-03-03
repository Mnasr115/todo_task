import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import '../../constants.dart';
import 'edit_todo_colors_list_view.dart';

class EditTodoViewBody extends StatefulWidget {
  const EditTodoViewBody({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;

  @override
  State<EditTodoViewBody> createState() => _EditTodoViewBodyState();
}

class _EditTodoViewBodyState extends State<EditTodoViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.todo.title = title ?? widget.todo.title;
              widget.todo.subTitle = content ?? widget.todo.subTitle;
              widget.todo.save();
              BlocProvider.of<TodosCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
            onChanged: (value) {
              title = value;
            },
            hint: widget.todo.title,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              content = value;
            },
            hint: widget.todo.subTitle,
            maxLines: 5,
          ),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.todo,
          ),
        ],
      ),
    );
  }
}
