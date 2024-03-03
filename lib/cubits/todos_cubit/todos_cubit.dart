import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/todo_model.dart';

import '../../constants.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial());

  List<TodoModel>? notes;
  fetchAllNotes() {
    var notesBox = Hive.box<TodoModel>(kTodoBox);

    notes = notesBox.values.toList();
    emit(TodosSuccess());
  }
}
