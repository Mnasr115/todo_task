import 'package:flutter/material.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/views/widgets/edit_view_body.dart';

class EditTodoView extends StatelessWidget {
  const EditTodoView({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditTodoViewBody(
        todo: todo,
      ),
    );
  }
}
