import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/network/exception_handler.dart';
import 'package:flutter_training/ui/screen/todo/model/todo_model.dart';
import 'package:flutter_training/ui/screen/todo/view_model/todo_service.dart';
import 'package:flutter_training/ui/screen/todo/view_model/todo_state.dart';
import 'package:flutter_training/util/in_app_notication_service.dart';
import 'package:flutter_training/util/localization_service.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());

  final TodoService todoService = TodoService();

  final List<TodoModel> _todos = [];

  List<TodoModel> get todos => _todos;

  Future<void> loadTodos() async {
    emit(TodoLoading());
    try {
      final todos = await todoService.fetchTodos(completed: false);
      final completed = await todoService.fetchTodos(completed: true);

      await todoService.cancelAllScheduledNotifications();
      todoService.cancelAllInAppNotifications();
      for (final todo in todos) {
        await todoService.scheduleTodoNotification(todo);
        todoService.scheduleInAppNotification(todo);
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
      await todoService.addTodo(todo);
      emit(TodoOperationSuccess(LocalizationService.current.todo_add_success));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> updateTodo(TodoModel todo) async {
    emit(TodoLoading());
    try {
      await todoService.updateTodo(todo);
      emit(TodoOperationSuccess(LocalizationService.current.todo_update_success));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> updateTodoStatus(TodoModel todo, bool completed) async {
    emit(TodoLoading());
    try {
      await todoService.updateTodoStatus(todo.id!, completed);
      emit(TodoOperationSuccess(LocalizationService.current.todo_update_status_success));
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }

  Future<void> deleteTodo(TodoModel todo) async {
    //emit(TodoLoading());
    try {
      await todoService.deleteTodo(todo.id!);
      await todoService.cancelTodoNotification(todo);
      todoService.cancelInAppNotification(todo);
      print('cancelTodoNotification: ${todo.taskTitle}');
      //emit(TodoOperationSuccess('Xoá thành công'));
      ExceptionHandler.showSuccessSnackBar(LocalizationService.current.todo_delete_success);
    } catch (e) {
      ExceptionHandler.showErrorSnackBar('$e');
      emit(TodoError());
    }
  }
}
