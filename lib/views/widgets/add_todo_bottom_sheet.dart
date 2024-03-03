import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/cubit/add_todo_cubit.dart';
import '../../cubits/todos_cubit/todos_cubit.dart';
import 'add_todo_form.dart';

class AddTodoBottomSheet extends StatelessWidget {
  const AddTodoBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddTodoCubit(),
      child: BlocConsumer<AddTodoCubit, AddTodoState>(
        listener: (context, state) {
          if (state is AddTodoFailure) {}

          if (state is AddTodoSuccess) {
            BlocProvider.of<TodosCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddTodoLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
