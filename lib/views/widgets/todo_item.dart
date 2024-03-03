import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'package:notes_app/models/todo_model.dart';
import 'package:notes_app/views/edit_todo_view.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({Key? key, required this.todo}) : super(key: key);

  final TodoModel todo;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return EditTodoView(
              todo: todo,
            );
          }),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(todo.color),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.only(left: 16, top: 24, bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                todo.title,
                style: const TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  todo.subTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.4),
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  todo.delete();

                  BlocProvider.of<TodosCubit>(context).fetchAllNotes();
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                todo.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
