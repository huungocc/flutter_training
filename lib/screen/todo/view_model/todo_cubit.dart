import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/screen/todo/model/todo_model.dart';
import 'package:flutter_training/screen/todo/view_model/todo_service.dart';
import 'package:flutter_training/screen/todo/view_model/todo_state.dart';
import 'package:flutter_training/util/in_app_notication_service.dart';
import 'package:flutter_training/util/localization_service.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await TodoService.fetchTodos(completed: false);
      final completed = await TodoService.fetchTodos(completed: true);

      await TodoService.cancelAllScheduledNotifications();
      TodoService.cancelAllInAppNotifications();
      for (final todo in todos) {
        await TodoService.scheduleTodoNotification(todo);
        TodoService.scheduleInAppNotification(todo);
        print('Scheduled: ${todo.taskTitle}');
      }

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
      emit(TodoOperationSuccess(LocalizationService.current.todo_add_success));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    emit(TodoLoading());
    try {
      await TodoService.updateTodo(todo);
      emit(TodoOperationSuccess(LocalizationService.current.todo_update_success));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> updateTodoStatus(TodoModel todo, bool completed) async {
    emit(TodoLoading());
    try {
      await TodoService.updateTodoStatus(todo.id!, completed);
      emit(TodoOperationSuccess(LocalizationService.current.todo_update_status_success));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    //emit(TodoLoading());
    try {
      await TodoService.deleteTodo(todo.id!);
      await TodoService.cancelTodoNotification(todo);
      TodoService.cancelInAppNotification(todo);
      print('cancelTodoNotification: ${todo.taskTitle}');
      //emit(TodoOperationSuccess('Xoá thành công'));
      ExceptionHandler.showSuccessSnackBar(LocalizationService.current.todo_delete_success);
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }
}
