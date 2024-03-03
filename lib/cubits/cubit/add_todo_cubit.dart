import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/todo_model.dart';

part 'add_todo_state.dart';

class AddTodoCubit extends Cubit<AddTodoState> {
  AddTodoCubit() : super(AddTodoInitial());

  Color color = const Color(0xffAC3931);
  addNote(TodoModel note) async {
    note.color = color.value;
    emit(AddTodoLoading());
    try {
      var notesBox = Hive.box<TodoModel>(kTodoBox);
      await notesBox.add(note);
      emit(AddTodoSuccess());
    } catch (e) {
      emit(AddTodoFailure(e.toString()));
    }
  }
}
