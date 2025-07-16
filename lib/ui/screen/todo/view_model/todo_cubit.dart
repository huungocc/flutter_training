import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/ui/screen/todo/model/todo_model.dart';
import 'package:flutter_training/ui/screen/todo/view_model/todo_service.dart';
import 'package:flutter_training/ui/screen/todo/view_model/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await TodoService.fetchTodos(completed: false);
      final completed = await TodoService.fetchTodos(completed: true);

      emit(TodoLoaded(todos: todos, completed: completed));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> addTodo(TodoModel todo) async {
    emit(TodoLoading());
    try {
      await TodoService.addTodo(todo);
      emit(TodoOperationSuccess('Thêm thành công'));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    emit(TodoLoading());
    try {
      await TodoService.updateTodo(todo);
      emit(TodoOperationSuccess('Cập nhật thành công'));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> updateTodoStatus(String id, bool completed) async {
    emit(TodoLoading());
    try {
      await TodoService.updateTodoStatus(id, completed);
      emit(TodoOperationSuccess('Cập nhật trạng thái thành công'));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> deleteTodo(String id) async {
    //emit(TodoLoading());
    try {
      await TodoService.deleteTodo(id);
      //emit(TodoOperationSuccess('Xoá thành công'));
      ExceptionHandler.showSuccessSnackBar('Xoá thành công');
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }
}
