import 'package:equatable/equatable.dart';
import 'package:flutter_training/ui/screen/todo/model/todo_model.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object?> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<TodoModel> todos;
  final List<TodoModel> completed;

  const TodoLoaded({
    this.todos = const [],
    this.completed = const [],
  });

  TodoLoaded copyWith({
    List<TodoModel>? todos,
    List<TodoModel>? completed,
  }) {
    return TodoLoaded(
      todos: todos ?? this.todos,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [todos, completed];
}

class TodoError extends TodoState {
  // final String message;
  //
  // const TodoError(this.message);
  //
  // @override
  // List<Object?> get props => [message];
}

class TodoOperationSuccess extends TodoState {
  final String message;

  const TodoOperationSuccess(this.message);

  @override
  List<Object?> get props => [message];
}
