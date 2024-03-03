import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/todos_cubit/todos_cubit.dart';
import 'custom_app_bar.dart';
import 'todo_item.dart';
import 'todos_list_view.dart';

class TodoViewBody extends StatefulWidget {
  const TodoViewBody({Key? key}) : super(key: key);

  @override
  State<TodoViewBody> createState() => _TodoViewBodyState();
}

class _TodoViewBodyState extends State<TodoViewBody> {

  @override
  void initState() {
   BlocProvider.of<TodosCubit>(context).fetchAllNotes();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'ToDo',
            icon: Icons.search,
          ),
          Expanded(
            child: TodoListView(),
          ),
        ],
      ),
    );
  }
}
