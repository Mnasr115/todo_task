part of 'todos_cubit.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}
class TodosSuccess extends TodosState {}